import '../driss_helpers/imagenetwork.dart';
import 'package:flutter/material.dart';
import '../driss_helpers/api.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';
import '../driss_helpers/putacad.dart';
import '../driss_helpers/addacad.dart';
import '../driss_helpers/delacad.dart';

class Readacad extends StatefulWidget {
  const Readacad({Key? key}) : super(key: key);

  @override
  _ReadacadState createState() => _ReadacadState();
}

class _ReadacadState extends State<Readacad> {
  late Future<List> pay;
  var serviceAcad = new ApiAcad();
  File? image;

  void initState() {
    pay = serviceAcad.getacad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          centerTitle: true,
          title: Text(
            "Liste des académiciens",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Readacad()),
                )
              },
              child: Icon(Icons.refresh),
              backgroundColor: Colors.orangeAccent,
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () => {
                showAdd(context),
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.orangeAccent,
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () => {},
              backgroundColor: Colors.black,
              child: Icon(Icons.arrow_back),
            )
          ],
        ),
        body: Center(
          child: FutureBuilder(
            future: pay,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List data = snapshot.data! as List;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // This Will Call When User Click On ListView Item
                      },
                      // Card Which Holds Layout Of ListView Item
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Container(
                                width: 100,
                                height: 100,
                                child: CircleAvatar(
                                    radius: 50.0,
                                    backgroundColor: Colors.grey,
                                    backgroundImage:
                                        verifImage(data[index]["photo"]))),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        data[index]["nom"],
                                        style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 233, 164, 36),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        data[index]["prenoms"],
                                        style: TextStyle(
                                          fontSize: 18,
                                          color:
                                              Color.fromARGB(255, 233, 164, 36),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Matricule: ${data[index]["matricule"]}  ',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[500],
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: () => {
                                          showDialogFunc(
                                              context,
                                              data[index]["id"],
                                              data[index]["nom"],
                                              data[index]["prenoms"],
                                              data[index]["matricule"],
                                              data[index]["photo"])
                                        },
                                        child: Text('Modifier'),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      ElevatedButton(
                                        onPressed: () => {
                                          showSuprresion(
                                              context, data[index]["id"])
                                        },
                                        child: Text('Suppression'),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Une erreur de connexion est survenue');
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
