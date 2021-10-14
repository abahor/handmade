import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/screens/about_us_screen.dart';
import 'package:handmade/screens/account_overview_screen.dart';

class AppDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(leading: Icon(Icons.shop),title: Text('Shop'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },

          ),

          Divider(),
          ListTile(leading: Icon(Icons.shop),title: Text('account'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(AccountOverViewScreen.routeName);
            },

          ),


          Divider(),
          ListTile(leading: Icon(Icons.shop),title: Text('about'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(About_us.routeName);
            },

          ),



        ],
      ),
    );
  }
}
