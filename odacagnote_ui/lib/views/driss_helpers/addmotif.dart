import 'package:flutter/material.dart';
import '../driss_helpers/api.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../driss/motif.dart';

showAdd(context) {
  final _formKey = GlobalKey<FormState>();
  final motif = TextEditingController();
  Map dated = {};
  var serviceAcad = new ApiMotif();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
        title: const Text('Modification'),
        content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: motif,
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
              dated = {"libelle": motif.text};
              await serviceAcad.postmotif(dated).then(
                (value) {
                  if (_formKey.currentState!.validate()) {
                    if (value == 405) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Une erreur est survenue")),
                      );
                    } else if (value == 300) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Motif existant")),
                      );
                    } else if (value == 400) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("erreur de méthode")),
                      );
                    } else if (value == 401) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Erreur json")),
                      );
                    } else if (value == 200) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Ajout réussie")));
                    }
                  }
                },
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Readmotif()),
              );
            },
            child: Text("Créer"),
            style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
          ),
          ElevatedButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Readmotif()),
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
