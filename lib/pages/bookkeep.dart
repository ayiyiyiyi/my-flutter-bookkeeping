import 'package:flutter/material.dart';
import './../config.dart';

import 'package:flutter_my_picker/flutter_my_picker.dart';
import 'package:flutter_my_picker/common/date.dart';

class Bookkeep extends StatefulWidget {
  @override
  _BookkeepState createState() => _BookkeepState();
}

class _BookkeepState extends State<Bookkeep> {
  DateTime date;
  String dateStr;
  @override
  void initState() {
    super.initState();
    DateTime _date = new DateTime.now();
    setState(() {
      date = _date;
      dateStr = MyDate.format('yyyy-MM-dd', _date);
    });
  }

  _change(formatString) {
    return (_date) {
      setState(() {
        date = _date;
        dateStr = MyDate.format(formatString, _date);
      });
    };
  }

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
                onPressed: () {}),
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
        body: Column(
          children: [
            Container(
                child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Global.borderColor, width: 1))),
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextField(
                      keyboardType: TextInputType.number,
                      autofocus: true,
                      style: TextStyle(fontSize: 36),
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          hintText: "0.00", border: InputBorder.none),
                      cursorColor: Colors.grey),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Global.borderColor, width: 1))),
                  margin: EdgeInsets.only(left: 20, right: 20),
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text(
                            '类别',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16, color: Global.greyColor),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            '餐饮',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: null,
                        child: Icon(Icons.navigate_next_rounded),
                      )
                    ],
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Global.borderColor, width: 1))),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: GestureDetector(
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
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                '时间',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16, color: Global.greyColor),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              child: Text(
                                dateStr,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: null,
                            child: Icon(Icons.navigate_next_rounded),
                          )
                        ],
                      ),
                    )),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Global.borderColor, width: 1))),
                  margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: TextField(
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          hintText: "有什么要备注的在这里写下吧~", border: InputBorder.none),
                      cursorColor: Colors.grey),
                ),
              ],
            )),
          ],
        ));
  }
}
