import 'package:flutter/material.dart';

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
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/logooda-l.png')
                )
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