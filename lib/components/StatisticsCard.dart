import 'package:flutter/material.dart';
import './../config.dart';

Widget statisticsCard(text, context) {
  return new Container(
    padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
    margin: EdgeInsets.only(bottom: 2),
    color: Colors.white,
    child: Flex(direction: Axis.horizontal, children: <Widget>[
      Expanded(
        flex: 1,
        child: Container(
            child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 6),
              width: double.infinity,
              child: Text(
                '50%',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        )),
      ),
      Expanded(
        flex: 2,
        child: Container(
            child: LinearProgressIndicator(
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation(Color.fromRGBO(245, 207, 39, 1)),
          value: .8,
        )),
      ),
      Expanded(
          flex: 1,
          child: Container(
            child: Column(children: [
              Container(
                  width: double.infinity,
                  child: new Text('200',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Global.textColor,
                      ))),
              Container(
                  padding: EdgeInsets.only(top: 6),
                  width: double.infinity,
                  child: new Text('12 笔',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Global.greyColor,
                      )))
            ]),
          )),
    ]),
  );
}
