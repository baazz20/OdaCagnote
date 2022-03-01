import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllClient extends StatefulWidget {
  @override
  State<AllClient> createState() => _AllClientState();
}

class _AllClientState extends State<AllClient> {
  late Future<List> clients;
  Future<List> getClients() async {
    var response =
        await Dio().get('http://192.168.252.107:8080/api/client/all');
    clients = getClients();
    //print(response);
    return response.data;
    //print(response.data);
  }

  @override
  void initState() {
    clients = getClients();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        //leading: Icon(Icons.search),
        actions: <Widget>[],
        elevation: 10,
        backgroundColor: Colors.grey[300],
        centerTitle: true,
        title: const Text("Paiements"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CupertinoSearchTextField(
                onChanged: (String value) {
                  print('The text has changed to: $value');
                },
                onSubmitted: (String value) {
                  print('Submitted text: $value');
                },
              ),
              FutureBuilder(
                future: clients,
                builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                  //return Text('Result: ${snapshot.data}');
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            subtitle: Text(
                                snapshot.data![index]['tel_client'].toString()),
                            leading: Icon(Icons.account_circle,
                                color: Colors.orange[700]),
                            title: Text(
                                '${snapshot.data![index]['nom_client'].toString()} ${snapshot.data![index]['prenoms_client'].toString()}'),
                          ),
                        );
                      },
                    );
                  }
                  return Center(
                    child: Column(
                      children: const <Widget>[
                        Text("Chargement..."),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (() {
          setState(() {
            getClients();
          });
        }),
        tooltip: 'Rafraichir',
        child: new Icon(
          Icons.refresh,
          color: Colors.orange[700],
        ),
      ),
    );
  }
}
