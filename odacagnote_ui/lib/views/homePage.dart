// ignore_for_file: prefer_const_constructors, unused_import, avoid_types_as_parameter_names, non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:odacagnote_ui/widgets/driss/navbar.dart';
import 'package:bs_flutter_selectbox/bs_flutter_selectbox.dart';
import '../widgets/button.dart';
import '../widgets/total_card.dart';
import 'nouveauPaiement.dart';
import 'package:flutter/cupertino.dart';

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


  var text;

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
            BsSelectBoxController _select1 = BsSelectBoxController(options: [
    BsSelectBoxOption(value: 1, text: Text('Lougue Kadi')),
    BsSelectBoxOption(value: 2, text: Text('Driss')),
    BsSelectBoxOption(value: 3, text: Text('Youssef')),
  ]);

  BsSelectBoxController _select2 = BsSelectBoxController(options: [
    BsSelectBoxOption(value: 1, text: Text('monsieur')),
    BsSelectBoxOption(value: 2, text: Text('retard')),
    BsSelectBoxOption(value: 3, text: Text('cache-nez')),
  ]);

          return StatefulBuilder(
            builder: (BuildContext context, setState) {
              return AlertDialog(
                title: Text('NOUVEAU PAIEMENT'),
                content: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
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
                              child: BsSelectBox(
                                hintText: 'Sélectionnez un académicien',
                                controller: _select1,
                                //   validators: [BsSelectValidators.required],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: BsSelectBox(
                                hintText: 'Entrez le motif',
                                controller: _select2, 
                                // validators: [BsSelectValidators.required],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusColor: Color.fromARGB(255, 243, 157, 77),
                                  hintText: 'Entrez le montant',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
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
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
      ),
      drawer: NavBar(),
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

  textFormField({required String hintText, required TextStyle style}) {}

  outlineinputborder() {}
}
