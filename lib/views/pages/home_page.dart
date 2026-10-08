import 'package:flutter/material.dart';
import 'package:flutter_app/views/widgets/container_widget.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
          HeroWidget(),
         ContainerWidget(
          title: 'Basic Layout',
           description: 'This is a description text'
           ),
           ContainerWidget(
          title: 'Basic Layout',
           description: 'This is a description text'
           ),
           ContainerWidget(
          title: 'Basic Layout',
           description: 'This is a description text'
           ),
           ContainerWidget(
          title: 'Basic Layout',
           description: 'This is a description text'
           ),
           ContainerWidget(
          title: 'Basic Layout',
           description: 'This is a description text'
           ),
        ],
        ),
      
      ),
    );
  }
}
