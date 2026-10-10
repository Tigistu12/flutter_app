import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter_app/data/classes/activity_class.dart';
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

  Future getData() async{
    try {
      final url = Uri.https('bored-api.appbrewery.com',  '/random');
       final response = await http.get(url);
        if (response.statusCode == 200) {
    return Activity.fromJson(convert.jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }

    } catch(e){
      print('Error: $e');
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(future: getData(),
      builder:(context, AsyncSnapshot snapshot) {
        Widget widget;
        if(snapshot.connectionState == ConnectionState.waiting){
          widget = CircularProgressIndicator();
        }
        if(snapshot.hasData){
          Activity activity = snapshot.data;
          widget = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
            HeroWidget(),
            Text(activity.activity),
            ],
          ),
        ),
         );
        } else {
          widget = Center(child: Text("Error"),
          );
        }
        return widget;
        
      },
      ),
  );
  }
}
