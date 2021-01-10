import 'package:flutter/material.dart';
import './../config.dart';

import 'package:flutter_my_picker/flutter_my_picker.dart';
import 'package:flutter_my_picker/common/date.dart';

import './../utils/common.dart';

import 'dart:convert';

class Bookkeep extends StatefulWidget {
  @override
  _BookkeepState createState() => _BookkeepState();
}

class _BookkeepState extends State<Bookkeep> {
  DateTime date;
  String dateStr;
  String cost;
  String note = '';
  List<String> typeList = [
    '三餐',
    '房租',
    '买菜',
    '生活缴费',
    '宵夜',
    '零食',
    '交通',
    '通讯',
    '家居日用',
    '娱乐',
    '宠物',
    '医疗',
    '服装',
    '护肤美妆',
    '其他'
  ];
  String type = '';

  @override
  void initState() {
    super.initState();
    DateTime _date = new DateTime.now();
    setState(() {
      date = _date;
      dateStr = MyDate.format('yyyy-MM-dd', _date);
    });
  }

  // 选择日期
  _changeDate(formatString) {
    return (_date) {
      setState(() {
        date = _date;
        dateStr = MyDate.format(formatString, _date);
      });
    };
  }

  _writeCostTolocalFile() async {
    List data;
    final res = await readCost();
    if (res.isNotEmpty) {
      data = jsonDecode(res);
    } else {
      data = [];
    }
    var index = data.indexWhere((item) => item['date'] == dateStr);
    var gender = 1;
    var name = '阿翊';
    final val = {
      "id": null,
      "type": type,
      "note": note,
      "cost": int.parse(cost),
      "gender": gender,
      "name": name,
      "time": date.millisecondsSinceEpoch
    };
    if (index >= 0) {
      data[index]['list'].insert(0, val);
    } else {
      data.add({
        "date": dateStr,
        "list": [val]
      });
    }
    var jsonStr = jsonEncode(data);
    await writeCost(jsonStr);
    Navigator.of(context).pop(true);
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 350,
              padding: EdgeInsets.only(top: 15),
              child: new ListView(
                  children: typeList
                      .map((e) => new ListTile(
                            title: new Container(
                              child: new Text(
                                e,
                                textAlign: TextAlign.center,
                              ),
                              width: double.infinity,
                            ),
                            selected: e == type,
                            onTap: () {
                              setState(() {
                                type = e;
                              });
                              Navigator.pop(context);
                            },
                          ))
                      .toList()));
        });
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
              onPressed: () async {
                if (cost == null) return;
                if (type == '') return;
                _writeCostTolocalFile();
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
                    onChanged: (String value) {
                      setState(() {
                        cost = value;
                      });
                    },
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    style: TextStyle(fontSize: 36),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        hintText: "0", border: InputBorder.none),
                    cursorColor: Colors.grey),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Global.borderColor, width: 1))),
                margin: EdgeInsets.only(left: 20, right: 20),
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: GestureDetector(
                    onTap: () {
                      _settingModalBottomSheet(context);
                    },
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
                              type,
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
                    )),
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Global.borderColor, width: 1))),
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
                        onConfirm: _changeDate('yyyy-MM-dd'),
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
                              '日期',
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
                    onChanged: (String value) {
                      setState(() {
                        note = value;
                      });
                    },
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                        hintText: "有什么要备注的写在这里吧~", border: InputBorder.none),
                    cursorColor: Colors.grey),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
