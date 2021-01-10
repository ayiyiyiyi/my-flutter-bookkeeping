import 'package:flutter/material.dart';
import 'dart:convert';

import './../config.dart';
import './../utils/common.dart';

class AddMessage extends StatefulWidget {
  @override
  _AddMessageState createState() => _AddMessageState();
}

class _AddMessageState extends State<AddMessage> {
  String content;
  void _writeMessageToLocalFile() async {
    List list = [];
    final res = await readLocalMessage();
    if (res.isNotEmpty) {
      list = jsonDecode(res).toList();
    }
    final val = {
      'time': new DateTime.now().millisecondsSinceEpoch,
      'content': content,
      'gender': 1,
      'name': 'ayi'
    };
    list.insert(0, val);
    var jsonStr = jsonEncode(list);
    await writeLocalMesage(jsonStr);
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Global.appBarBg,
        shadowColor: Colors.transparent,
        centerTitle: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.check, color: Colors.black),
              iconSize: 24,
              onPressed: () {
                _writeMessageToLocalFile();
              }),
        ],
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Global.textColor,
            ),
            iconSize: 22,
            onPressed: () => Navigator.pop(context),
          );
        }),
      ),
      backgroundColor: Global.appBarBg,
      body: Container(
        height: double.infinity,
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: TextField(
          maxLines: 32,
          // keyboardType: TextInputType.text,

          autofocus: true,
          style: TextStyle(fontSize: 16),
          decoration:
              InputDecoration(hintText: "写点儿什么吧...", border: InputBorder.none),
          cursorColor: Colors.grey,
          onChanged: (String value) {
            setState(() {
              content = value;
            });
          },
        ),
      ),
    );
  }
}
