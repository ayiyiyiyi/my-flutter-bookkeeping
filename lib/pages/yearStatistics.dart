import 'package:flutter/material.dart';
import 'package:memory/components/YearCard.dart';
import './../config.dart';
import './../components/YearCard.dart';
import './../utils/http.dart';
import './../utils/formateData.dart';

class YearStatistics extends StatefulWidget {
  @override
  _YearStatisticsState createState() => _YearStatisticsState();
}

class _YearStatisticsState extends State<YearStatistics> {
  List<YearDetail> yearList = [];
  void initState() {
    super.initState();
    getYearData();
  }

  void getYearData() async {
    final _list = await getYearList();
    setState(() {
      yearList = _list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.bgColor,
      appBar: AppBar(
        title: Text(
          '年统计',
          style: TextStyle(color: Global.textColor, fontSize: 16),
        ),
        backgroundColor: Global.bgColor,
        shadowColor: Colors.transparent,
        leading: Builder(builder: (context) {
          return IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Global.textColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              });
        }),
      ),
      body: ListView(
        children: yearList.map((e) => createYearCard(e, context)).toList(),
      ),
    );
  }
}
