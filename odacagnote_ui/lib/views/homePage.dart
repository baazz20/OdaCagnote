import 'dart:async';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/total_card.dart';
import 'nouveauPaiement.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // collect user input
  final _textcontrollerAMOUNT = TextEditingController();
  final _textcontrollerITEM = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isIncome = false;

  // enter the new transaction into the spreadsheet
  // void _enterTransaction() {
  //   GoogleSheetsApi.insert(
  //     _textcontrollerITEM.text,
  //     _textcontrollerAMOUNT.text,
  //     _isIncome,
  //   );
  //   setState(() {});
  // }

  // new transaction
  void _newTransaction() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: Text('NOUVEAU PAIEMENT'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Text('Expense'),
                      //     Switch(
                      //       value: _isIncome,
                      //       onChanged: (newValue) {
                      //         setState(() {
                      //           _isIncome = newValue;
                      //         });
                      //       },
                      //     ),
                      //     Text('Income'),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Row(
                        children: [
                          Expanded(
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Montant?',
                                ),
                                validator: (text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Entrer le montant';
                                  }
                                  return null;
                                },
                                controller: _textcontrollerAMOUNT,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Motif?',
                              ),
                              controller: _textcontrollerITEM,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  MaterialButton(
                    color: Colors.grey[600],
                    child:
                        Text('Quitter', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    color: Colors.grey[600],
                    child:
                        Text('Entrer', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //   _enterTransaction();
                      //   Navigator.of(context).pop();
                      // }
                    },
                  )
                ],
              );
            },
          );
        });
  }

  // wait for the data to be fetched from google sheets
  // bool timerHasStarted = false;
  // void startLoading() {
  //   timerHasStarted = true;
  //   Timer.periodic(Duration(seconds: 1), (timer) {
  //     if (GoogleSheetsApi.loading == false) {
  //       setState(() {});
  //       timer.cancel();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // start loading until the data arrives

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TopNeuCard(
              solde: '\20,200 FCFA',
              nombreTotalPayementDuJour: '\200 FCFA',
              soldeDuJour: '\5',
            ),
            Expanded(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(itemBuilder: (context, index) {
                          return MyTransaction(
                            transactionName: '',
                            money: '',
                            expenseOrIncome: '',
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
            ),
            PlusButton(
              function: _newTransaction,
            ),
          ],
        ),
      ),
    );
  }
}
