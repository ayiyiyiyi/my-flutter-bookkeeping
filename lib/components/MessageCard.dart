import 'package:flutter/material.dart';
import 'package:memory/utils/formateData.dart';
import './../config.dart';

Widget messageCard(MessageDetail detail, context) {
  return new Container(
      padding: EdgeInsets.only(top: 16, bottom: 12, left: 16, right: 16),
      margin: EdgeInsets.only(top: 0, bottom: 2, left: 8, right: 8),
      color: Colors.white,
      child: new Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              detail.content,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 12),
              width: double.infinity,
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: detail.name + '    ',
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          detail.gender == 1 ? Global.girlText : Global.boyText,
                      fontWeight: FontWeight.w400,
                    )),
                TextSpan(
                    text: detail.time.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: Global.greyColor,
                      fontWeight: FontWeight.w200,
                    ))
              ])))
        ],
      ));
}
