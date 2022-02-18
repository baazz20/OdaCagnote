import 'package:odacagnote_ui/views/homePage.dart';
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
            leading: Icon(Icons.admin_panel_settings),
            title: Text('Administration'),
            onTap: () => {

            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Paiements'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Payer'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Payer'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Payer'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Payer'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}