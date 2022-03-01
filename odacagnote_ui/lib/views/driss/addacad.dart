import 'package:flutter/material.dart';


class Addacad extends StatefulWidget {
  const Addacad({Key? key}) : super(key: key);

  @override
  _AddacadState createState() => _AddacadState();
}

class _AddacadState extends State<Addacad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: Text("Menu académicien", style: TextStyle(
              color: Colors.black,fontSize: 20 ,fontWeight: FontWeight.bold),)
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
