import 'package:flutter/material.dart';
import 'package:handmade/widgets/app_drawer.dart';

class About_us extends StatefulWidget {

  static const String routeName = '/about_us';

  const About_us({Key? key}) : super(key: key);

  @override
  _About_usState createState() => _About_usState();
}

class _About_usState extends State<About_us> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Text('We are a application who care providing people with information about how to sell handmade products'),
          ],
        ),
      ),
    );
  }
}
