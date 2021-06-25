import "package:flutter/material.dart";

class AppDrawbar extends StatefulWidget {
  AppDrawbar({Key? key}) : super(key: key);

  @override
  _AppDrawbarState createState() => _AppDrawbarState();
}

class _AppDrawbarState extends State<AppDrawbar> {
  
  Widget _getAppHeader() {
    return Container(
        width: 20,
        height: 60,
        child: DrawerHeader(
          decoration: BoxDecoration(),
          child: Text("header"),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        child: Drawer(
          elevation: 1,
          child: ListView(
            // padding: EdgeInsets.zero,
            children: <Widget>[
              this._getAppHeader(),
              // DrawerHeader(child: Text('StockER')),
              ListTile(leading: Icon(Icons.message), title: Text("Message")),
              ListTile(leading: Icon(Icons.dangerous), title: Text("Danger")),
              ListTile(leading: Icon(Icons.message), title: Text("Message")),
            ],
          ),
        ));
  }
}
