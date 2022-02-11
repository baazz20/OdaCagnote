import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './models/Academicien.dart';
import './models/Payment.dart';
import './services/service_adacemicien.dart';
import './services/service_payment.dart';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<AcademicienModel>> futureAcademicien;
  var serviceAcad = new ApiServiceAcademicien();

  @override
  void initState() {
    super.initState();
    futureAcademicien = serviceAcad.getAcademiciens();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Academicien Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Academicien Example'),
        ),
        body: Center(
          child: FutureBuilder<List<AcademicienModel>>(
            future: futureAcademicien,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.toList().toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
