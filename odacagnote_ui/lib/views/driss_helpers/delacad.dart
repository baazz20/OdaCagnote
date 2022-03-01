import 'package:flutter/material.dart';
import '../driss_helpers/api.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import '../driss/acad.dart';

showSuprresion(context, id) {
  var serviceAcad = new ApiAcad();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
        title: Text('Suppression'),
        content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Voulez vous supprimez ?'),
            )),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await serviceAcad.delacad(id).then(
                (value) {
                  if (value == 300) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("L'academicien est inexistant")),
                    );
                  } else if (value == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Suppression réussie")));
                  }
                },
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Readacad()),
              );
            },
            child: Text("Suppression"),
            style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
          ),
          ElevatedButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Readacad()),
              )
            },
            child: Text("Retour"),
            style: ElevatedButton.styleFrom(primary: Colors.black),
          ),
        ],
      );
    },
  );
}
