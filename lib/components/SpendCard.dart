import 'package:flutter/material.dart';
import 'package:memory/utils/formateData.dart';
import './../config.dart';

Widget spendCard(SpendDetail detail, context) {
  return new Container(
    padding: EdgeInsets.only(top: 6, bottom: 6, left: 20, right: 16),
    margin: EdgeInsets.only(bottom: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: detail.gender == 1 ? Global.girlBg : Global.boyBg,
    ),
    child: Flex(direction: Axis.horizontal, children: <Widget>[
      Expanded(
        flex: 1,
        child: Container(
            child: new Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                detail.type,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 2),
                width: double.infinity,
                child: Text(detail.note,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      color: Global.greyColor,
                      fontWeight: FontWeight.w200,
                    )))
          ],
        )),
      ),
      Expanded(
          flex: 1,
          child: Container(
              child: new Text(detail.cost.toString(),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Global.textColor,
                  ))))
    ]),
  );
}
