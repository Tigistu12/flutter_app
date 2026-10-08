import 'package:flutter/material.dart';
import 'package:flutter_app/data/notifiers.dart';
import 'package:flutter_app/views/pages/welcome_page.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: LayoutBuilder(
        builder: ((context, BoxConstraints constraints) {
        return FractionallySizedBox(
        widthFactor: constraints.maxWidth> 500 ? 0.5 : 1.0,
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.0,
              
            ),
            ListTile(
              title: Text('Logout'),
              onTap: (){
                selectedPageNotifier.value = 0;
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return WelcomePage();
                },
                ),
                );
              },
            ),
        ],
        ),
      );
      }),
      )
    );
  }
}
