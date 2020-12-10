import 'package:flutter/material.dart';
import './../config.dart';

Widget messageCard(color, context) {
  return new Container(
      padding: EdgeInsets.only(top: 16, bottom: 12, left: 16, right: 16),
      margin: EdgeInsets.only(top: 0, bottom: 2, left: 8, right: 8),
      color: Colors.white,
      child: new Column(
        children: [
          Container(
            width: double.infinity,
            child: Text(
              '这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~这里可以写碎碎念~',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 12),
              width: double.infinity,
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: color ? '阿翊   ' : '阿翊   ',
                    style: TextStyle(
                      fontSize: 14,
                      color: color ? Global.girlText : Global.boyText,
                      fontWeight: FontWeight.w400,
                    )),
                TextSpan(
                    text: '2020-10-30 18:00:01',
                    style: TextStyle(
                      fontSize: 14,
                      color: Global.greyColor,
                      fontWeight: FontWeight.w200,
                    ))
              ])))
        ],
      ));
}
