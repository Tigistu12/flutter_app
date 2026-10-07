import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/login_page.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          HeroWidget(title: "Welcome"),
          SizedBox(height: 20.0),
                    FilledButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginPage();
            })); 
          },
      child: Text('Get Started'),
          ),
           SizedBox(height: 20.0),

          FilledButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginPage();
            })); 
          },
      child: Text('Login'),
          ),
        ],
        ),
      ),
    );
  }
}