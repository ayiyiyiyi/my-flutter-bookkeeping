import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:memory/utils/formateData.dart';
import './../utils/common.dart';

import './../components/MessageCard.dart';
import './../pages/addMessage.dart';
import './../utils/http.dart';

class MessageBoard extends StatefulWidget {
  @override
  _MessageBoardState createState() => _MessageBoardState();
}

class _MessageBoardState extends State<MessageBoard> {
  List<MessageDetail> messageList = [];
  void initState() {
    super.initState();
    getLocalMesage();
  }

  void getMessage() async {
    final list = await getMessageList();
    setState(() {
      messageList = list;
    });
  }

  void getLocalMesage() async {
    final res = await readLocalMessage();
    print(res);
    if (res.isNotEmpty) {
      List list = jsonDecode(res).toList();
      setState(() {
        messageList = list.map((e) => MessageDetail.formJson(e)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('碎碎念...',
            style: TextStyle(color: Colors.black, fontSize: 14)),
        backgroundColor: Colors.white54,
        shadowColor: Colors.transparent,
        centerTitle: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.edit_rounded, color: Colors.black),
              iconSize: 15,
              onPressed: () async {
                bool args = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return AddMessage();
                }));
                if (args == true) {
                  getLocalMesage();
                }
              }),
        ],
      ),
      body: new ListView(
          children: messageList.map((e) => messageCard(e, context)).toList()),
    );
  }
}
