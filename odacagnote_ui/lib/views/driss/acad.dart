////menu

import 'package:flutter/material.dart';
import 'package:odacagnote_ui/widgets/driss/animation.dart';

class Menuglobal extends StatefulWidget {
  const Menuglobal({Key? key}) : super(key: key);

  @override
  _MenuglobalState createState() => _MenuglobalState();
}

class _MenuglobalState extends State<Menuglobal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          backgroundColor: Colors.grey[300],
          title: const Text(
            "Menu académicien",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DelayedAnimation(
              delay: 700,
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => {},
                  child: Text('Ajouter academicien'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DelayedAnimation(
              delay: 300,
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () => {},
                  child: Text(
                    'Liste des academiciens',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
