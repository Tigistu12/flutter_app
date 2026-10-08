import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/login_page.dart';
import 'package:flutter_app/views/pages/onboarding_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(height: 20.0),
                        FilledButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OnboardingPage();
                })); 
              },
          child: Text('Get Started'),
              ),
               SizedBox(height: 20.0),
          
              FilledButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginPage(title: "Login");
                })); 
              },
          child: Text('Login'),
              ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}