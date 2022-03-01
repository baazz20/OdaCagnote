import '../driss_helpers/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import '../driss_helpers/putmotif.dart';
import '../driss_helpers/addmotif.dart';
import '../driss_helpers/delmotif.dart';

class Readmotif extends StatefulWidget {
  const Readmotif({Key? key}) : super(key: key);

  @override
  _ReadmotifState createState() => _ReadmotifState();
}

class _ReadmotifState extends State<Readmotif> {
  late Future<List> pay;
  var serviceAcad = new ApiMotif();

  void initState() {
    pay = serviceAcad.getmotif();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[300],
          centerTitle: true,
          title: Text(
            "Liste de tous les motifs",
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
                  MaterialPageRoute(builder: (context) => const Readmotif()),
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
                      onTap: () {},
                      // Card Which Holds Layout Of ListView Item
                      child: Card(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Motif : ",
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
                                        data[index]["libelle"],
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      ElevatedButton(
                                        onPressed: () => {
                                          showDialogFunc(
                                              context,
                                              data[index]["libelle"],
                                              data[index]["id"])
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
                                              context,
                                              data[index]["libelle"],
                                              data[index]["id"])
                                        },
                                        child: Text('Suppression'),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red),
                                      ),
                                    ],
                                  ),
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
                return Text('Une erreur de connexion');
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
