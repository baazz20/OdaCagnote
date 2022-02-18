import 'package:flutter/material.dart';
import 'package:odacagnote_ui/views/driss/acad.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Menu'),
            accountEmail: Text(''),
            decoration: BoxDecoration(
                color: Colors.orangeAccent,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Accueil'),
            onTap: () => {

            },
          ),
          ListTile(
            leading: Icon(Icons.manage_accounts),
            title: Text('Academicien'),
            onTap: () => {
              Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const Menuglobal())
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.tab),
            title: Text('Motifs'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}