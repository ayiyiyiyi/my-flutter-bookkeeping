import 'package:flutter/material.dart';
import 'package:memory/components/Drawer.dart';
import './../config.dart';
import './../components/SpendCard.dart';
import './../pages/bookkeep.dart';

import 'package:flutter_my_picker/flutter_my_picker.dart';
import 'package:flutter_my_picker/common/date.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  DateTime date;
  String dateStr;
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Bookkeep();
                }));
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
                                  text: '3000', style: TextStyle(fontSize: 30))
                            ]),
                            textAlign: TextAlign.right),
                      ))
                ],
              )),
          Container(
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              child: ListBody(
                children: [
                  spendCard(true, context),
                  spendCard(false, context),
                  spendCard(false, context),
                  spendCard(true, context),
                  spendCard(false, context),
                  spendCard(false, context),
                  spendCard(false, context),
                  spendCard(false, context),
                  spendCard(true, context),
                  spendCard(false, context),
                  spendCard(false, context),
                  spendCard(false, context),
                ],
              ))
        ],
      ),
    );
  }
}
