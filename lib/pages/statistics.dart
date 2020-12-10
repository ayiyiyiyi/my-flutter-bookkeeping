import 'package:flutter/material.dart';
import './../config.dart';
import './../components/StatisticsCard.dart';
import './yearStatistics.dart';

import 'package:flutter_my_picker/flutter_my_picker.dart';
import 'package:flutter_my_picker/common/date.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  DateTime date;
  String dateStr;
  @override
  void initState() {
    super.initState();
    DateTime _date = new DateTime.now();
    setState(() {
      date = _date;
      dateStr = MyDate.format('yyyy-MM', _date);
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
      appBar: AppBar(
        title: GestureDetector(
            onTap: () {
              MyPicker.showMonthPicker(
                context: context,
                current: date,
                isShowHeader: true,
                start: '2020-01-01',
                end: MyDate.getNow(),
                onConfirm: _change('yyyy-MM'),
                squeeze: 1.45,
                color: Colors.black,
                magnification: 1,
              );
            },
            child: Text(
              dateStr,
              style: TextStyle(color: Global.textColor, fontSize: 18),
            )),
        backgroundColor: Global.bgColor,
        shadowColor: Colors.transparent,
        leading: Builder(builder: (context) {
          return IconButton(
              icon: Icon(
                Icons.access_time_rounded,
                color: Global.textColor,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return YearStatistics();
                }));
              });
        }),
      ),
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.only(
                  top: 20.0, left: 20.0, bottom: 20, right: 20.0),
              width: double.infinity,
              child: Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Text('当月花费'),
                    ),
                  ),
                  Expanded(
                    flex: null,
                    child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: '¥ ',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(245, 207, 39, 1))),
                          TextSpan(
                              text: '3000',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(245, 207, 39, 1)))
                        ]),
                        textAlign: TextAlign.right),
                  )
                ],
              )),
          statisticsCard('餐饮', context),
          statisticsCard('娱乐', context),
          statisticsCard('交通', context),
          statisticsCard('通讯', context),
          statisticsCard('购物', context),
          statisticsCard('医疗', context),
          statisticsCard('宠物', context),
          statisticsCard('通讯', context),
          statisticsCard('购物', context),
          statisticsCard('医疗', context),
          statisticsCard('宠物', context),
          statisticsCard('通讯', context),
          statisticsCard('购物', context),
          statisticsCard('医疗', context),
          statisticsCard('宠物', context),
        ],
      ),
    );
  }
}
