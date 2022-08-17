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

  List<Widget> _drawerList() {
    return <Widget>[
      this._getAppHeader(),
      ListTile(leading: Icon(Icons.message), title: Text("Message")),
      ListTile(leading: Icon(Icons.dangerous), title: Text("Danger")),
      ListTile(leading: Icon(Icons.message), title: Text("Message")),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 200,
            height: 300,
            child: Drawer(
              elevation: 1,
              child: ListView(
                  children: this._drawerList()),
            )));
  }
}
