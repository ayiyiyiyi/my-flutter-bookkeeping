import 'package:flutter/material.dart';
import 'package:memory/utils/formateData.dart';
import './../config.dart';

Widget createYearCard(YearDetail detail, context) {
  return Container(
    width: double.infinity,
    child: Column(
      children: [
        Container(
          padding:
              EdgeInsets.only(top: 26.0, left: 20.0, bottom: 10, right: 20.0),
          width: double.infinity,
          child: Flex(
            direction: Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  detail.year,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "¥ " + detail.total.toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 22, color: Color.fromRGBO(245, 207, 39, 1)),
                ),
              )
            ],
          ),
        ),
        Column(
          children: detail.list.map((e) => monthTotalList(e, context)).toList(),
        )
      ],
    ),
  );
}

Widget monthTotalList(MonthTotal data, context) {
  return Container(
      margin: EdgeInsets.only(bottom: 1.0),
      padding: EdgeInsets.only(top: 12.0, left: 20.0, bottom: 12, right: 20.0),
      color: Colors.white,
      child: Flex(direction: Axis.horizontal, children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            child: Text(
              data.month.toString() + '月',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            child: Text(
              data.cost.toString(),
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 20),
            ),
          ),
        )
      ]));
}
