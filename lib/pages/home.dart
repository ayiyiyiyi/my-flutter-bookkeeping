import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:memory/components/Drawer.dart';
import './../config.dart';
import './../components/SpendCard.dart';
import './../pages/bookkeep.dart';

import 'package:flutter_my_picker/flutter_my_picker.dart';
import 'package:flutter_my_picker/common/date.dart';

// import './../utils/http.dart';
import 'package:dio/dio.dart';
import './../utils/formateData.dart';
import './../utils/common.dart';

var dio = Dio();

class Home extends StatefulWidget {
  final arguments;
  Home({this.arguments});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  DateTime date;
  String dateStr;
  List<SpendDetail> spendList = [];
  int dailyTotal = 0;
  // drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    DateTime _date = new DateTime.now();
    setState(() {
      date = _date;
      dateStr = MyDate.format('yyyy-MM-dd', _date);
    });
    _controller = AnimationController(vsync: this);
    getLocalCostFile();
  }

  void getLocalCostFile() async {
    final res = await readCost();
    if (res.isNotEmpty) {
      var list = jsonDecode(res).toList();
      int count = 0;
      list.forEach((item) => {
            if (item['date'] == dateStr)
              {
                setState(() {
                  spendList = (item['list'] as List)
                      .map((e) => SpendDetail.formJson(e))
                      .toList();
                  spendList.forEach((item) => {count = item.cost + count});
                  dailyTotal = count;
                })
              }
          });
      print(spendList);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _change(formatString) {
    return (_date) {
      setState(() {
        date = _date;
        dateStr = MyDate.format(formatString, _date);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: GestureDetector(
            onTap: () {
              MyPicker.showDatePicker(
                context: context,
                current: date,
                isShowHeader: true,
                start: '2020-01-01',
                end: MyDate.getNow(),
                onConfirm: _change('yyyy-MM-dd'),
                squeeze: 1.45,
                color: Colors.black,
                magnification: 1,
              );
            },
            child: new Text(
              dateStr,
              style: TextStyle(color: Global.textColor, fontSize: 18),
            )),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.menu_rounded,
              color: Global.textColor,
            ),
            onPressed: _openDrawer,
          );
        }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add_circle_outline_rounded,
                  color: Global.textColor),
              onPressed: () async {
                bool args = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return Bookkeep();
                }));
                if (args) {
                  getLocalCostFile();
                }
              }),
        ],
        backgroundColor: Global.bgColor,
        shadowColor: Colors.transparent,
      ),
      drawer: HomeDrawer(),
      body: new ListView(
        children: [
          Container(
              padding: EdgeInsets.only(
                  top: 40.0, left: 20.0, bottom: 10, right: 20.0),
              width: double.infinity,
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text('当日花费'),
                    ),
                  ),
                  Expanded(
                      flex: null,
                      child: Container(
                        child: Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text: '¥ ', style: TextStyle(fontSize: 16)),
                              TextSpan(
                                  text: dailyTotal.toString(),
                                  style: TextStyle(fontSize: 30))
                            ]),
                            textAlign: TextAlign.right),
                      ))
                ],
              )),
          Container(
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              child: ListBody(
                  children:
                      spendList.map((e) => spendCard(e, context)).toList()))
        ],
      ),
    );
  }
}
