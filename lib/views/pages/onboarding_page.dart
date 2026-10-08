import 'package:flutter/material.dart';
import 'package:flutter_app/data/constants.dart';
import 'package:flutter_app/views/pages/login_page.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HeroWidget(
                  ),
                  SizedBox(height: 20.0),
                  Text("Welcome to Flutter App", 
                  style: KTextStyle.descriptionText,
                  textAlign: TextAlign.justify,
                  ),
                  FilledButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) {
                      return LoginPage(
                        title: "Register",
                      );
                      
                    },));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 40.0),
              ),
               child: Text('Next'),
          ),
              SizedBox(height: 50.0),
            ],   
            ),
          ),
        ),
      )

    );
  }
}