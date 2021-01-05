import 'package:flutter/material.dart';
import './../config.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: Drawer(
          child: ListView(
        padding: EdgeInsets.only(left: 20, right: 0),
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.only(top: 60, left: 15),
            decoration: BoxDecoration(),
            child: Text(
              '阿翊',
              style: TextStyle(
                color: Global.textColor,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('pull'),
          ),
          ListTile(
            title: Text('push'),
          ),
          ListTile(
            title: Text('version 0.0.1'),
          ),
        ],
      )),
    );
  }
}
