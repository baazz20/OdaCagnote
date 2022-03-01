import 'package:flutter/material.dart';
import 'package:odacagnote_ui/widgets/driss/animation.dart';
import 'call_api_list_of_payments.dart';

class PaymentGlobalMenu extends StatefulWidget {
  const PaymentGlobalMenu({Key? key}) : super(key: key);

  @override
  State<PaymentGlobalMenu> createState() => _PaymentGlobalMenuState();
}

class _PaymentGlobalMenuState extends State<PaymentGlobalMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text(
          "Menu des paiements",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DelayedAnimation(
              delay: 700,
              child: Container(
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AllClient()))
                  },
                  child: const Text('Liste des paiements'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
