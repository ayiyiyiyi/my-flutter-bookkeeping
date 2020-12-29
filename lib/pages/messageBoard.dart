import 'package:flutter/material.dart';
import 'package:memory/utils/formateData.dart';
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
    getMessage();
  }

  void getMessage() async {
    final list = await getMessageList();
    setState(() {
      messageList = list;
    });
    print(list);
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddMessage();
                }));
              }),
        ],
      ),
      body: new ListView(
          children: messageList.map((e) => messageCard(e, context)).toList()),
    );
  }
}
