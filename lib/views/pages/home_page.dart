import 'package:flutter/material.dart';
import 'package:flutter_app/data/constants.dart';
import 'package:flutter_app/views/pages/course_page.dart';
import 'package:flutter_app/views/widgets/container_widget.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      KValue.keyConcepts,
      KValue.cleanU,
      KValue.fixBugs,
      KValue.basicLayout,

    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
          HeroWidget(
           nextPage: CoursePage(),
          ),
          ...List.generate(
            list.length, (index) {
          return  ContainerWidget(
          title: list.elementAt(index),
         description: 'This is a description text'
         );
        }),
          // or  on the other hand we can do that 
        //   Column(children: List.generate(5, (index) {
        //     return  ContainerWidget(
        //     title: KValue.keyConcepts,
        //    description: 'This is a description text'
        //    );
        //   }
        //   ),
        // ),
        
          ],
        ),
      ),
    );
  }
}
