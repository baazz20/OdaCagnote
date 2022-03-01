import 'package:flutter/material.dart';
import '../driss_helpers/api.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import '../driss/acad.dart';

showDialogFunc(context, id, nom, prenoms, matricule, photo) {
  final _formKey = GlobalKey<FormState>();
  final _nom = TextEditingController(text: "${nom}");
  final _prenoms = TextEditingController(text: "${prenoms}");
  final _matricule = TextEditingController(text: "${matricule}");
  File? image2;
  Map dated = {};
  var serviceAcad = new ApiAcad();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      image2 = imageTemporary;
    } on PlatformException catch (e) {
      print('Falled topick image: $e');
    }
  }

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
        title: Text('Update'),
        content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        pickImage();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          "http://192.168.252.127:8000$photo",
                          width: 200,
                          height: 200,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ),
                    TextFormField(
                      controller: _nom,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez une valeur';
                        }
                      },
                    ),
                    TextFormField(
                      controller: _prenoms,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez une valeur';
                        }
                      },
                    ),
                    TextFormField(
                      controller: _matricule,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez une valeur';
                        }
                      },
                    ),
                  ],
                ))),
        actions: [
          ElevatedButton(
            onPressed: () async {
              if (image2 != null) {
                dated = {
                  "id": "${id}",
                  "nom": _nom.text,
                  "prenoms": _prenoms.text,
                  "matricule": _matricule.text,
                  "photo": image2
                };
              }
              ;
              dated = {
                "id": id,
                "nom": _nom.text,
                "prenoms": _prenoms.text,
                "matricule": _matricule.text
              };
              await serviceAcad.putacad(dated, id).then(
                (value) {
                  if (_formKey.currentState!.validate()) {
                    if (value == 405) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Erreur back-end survenue")),
                      );
                    } else if (value == 300) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Académicien introuvable")),
                      );
                    } else if (value == 301) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Matricule existant")),
                      );
                    } else if (value == 200) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Modification réussie")));
                    }
                  }
                },
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Readacad()),
              );
            },
            child: Text("Modifier"),
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
