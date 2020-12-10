import 'package:flutter/material.dart';
import './../config.dart';

Widget spendCard(color, context) {
  return new Container(
    padding: EdgeInsets.only(top: 6, bottom: 6, left: 20, right: 16),
    margin: EdgeInsets.only(bottom: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      color: color ? Global.girlBg : Global.boyBg,
      // border: Border(
      //     bottom: BorderSide(color: Colors.black54, width: 1),
      //     top: BorderSide(color: Colors.black54, width: 1),
      //     left: BorderSide(color: Colors.black54, width: 1),
      //     right: BorderSide(color: Colors.black54, width: 1)),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.black54,
      //     blurRadius: 2.0,
      //   ),
      // ]
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
                '晚餐',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 2),
                width: double.infinity,
                child: Text('出去吃',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      color: Global.greyColor,
                      fontWeight: FontWeight.w200,
                    )))
          ],
        )),
      ),
      Expanded(
          flex: 1,
          child: Container(
              child: new Text('20',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Global.textColor,
                  ))))
    ]),
  );
}
