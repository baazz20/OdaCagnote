import 'package:flutter/material.dart';
import '../driss_helpers/api.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import '../driss/acad.dart';

showAdd(context) {
  final _formKey = GlobalKey<FormState>();
  final _nom = TextEditingController(text: "");
  final _prenoms = TextEditingController(text: "");
  final _matricule = TextEditingController(text: "");
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
                        child: Image.asset(
                          "assets/management.png",
                          width: 70,
                          height: 70,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _nom,
                      decoration:
                          new InputDecoration.collapsed(hintText: 'Nom'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez une valeur';
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _prenoms,
                      decoration:
                          new InputDecoration.collapsed(hintText: 'Prénom'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrez une valeur';
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _matricule,
                      decoration:
                          new InputDecoration.collapsed(hintText: 'Matricule'),
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
                  "nom": _nom.text,
                  "prenoms": _prenoms.text,
                  "matricule": _matricule.text,
                  "photo": image2
                };
              }
              ;
              dated = {
                "nom": _nom.text,
                "prenoms": _prenoms.text,
                "matricule": _matricule.text
              };
              await serviceAcad.postacad(dated).then(
                (value) {
                  if (_formKey.currentState!.validate()) {
                    if (value == 405) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Erreur back-end survenue")),
                      );
                    } else if (value == 300) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Matricule existant")),
                      );
                    } else if (value == 301) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Matricule existant")),
                      );
                    } else if (value == 200) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Académicien ajoutée")));
                    }
                  }
                },
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Readacad()),
              );
            },
            child: Text("Créer"),
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
