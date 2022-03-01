import 'package:flutter/material.dart';
import '../driss_helpers/api.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../driss/motif.dart';

showSuprresion(context, libelle, id) {
  var serviceAcad = new ApiMotif();

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
              await serviceAcad.delmotif(id).then(
                (value) {
                  if (value == "404") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Le motif est inexistant")),
                    );
                  } else if (value == "200") {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Suppression réussie")));
                  }
                },
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Readmotif()),
              );
            },
            child: Text("Suppression"),
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
