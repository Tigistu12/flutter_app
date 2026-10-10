import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';
import 'package:http/http.dart' as http;
class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}
class _CoursePageState extends State<CoursePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async{
    try {
      final url = Uri.https('bored-api.appbrewery.com',  '/random');
       final response = await http.get(url);
       if (response.statusCode == 200){
        final jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

        var itemCount = jsonResponse['activity'];

        print(itemCount);
       } else {
        print('Request failed with status: ${response.statusCode}');
       }

    } catch(e){
      print('Error: $e');
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
          HeroWidget(),
          ],
        ),
      ),
    )
  );
  }
}
