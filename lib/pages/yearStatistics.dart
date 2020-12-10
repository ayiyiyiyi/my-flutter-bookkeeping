import 'package:flutter/material.dart';
import './../config.dart';
import './../components/StatisticsCard.dart';

class YearStatistics extends StatefulWidget {
  @override
  _YearStatisticsState createState() => _YearStatisticsState();
}

class _YearStatisticsState extends State<YearStatistics> {
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
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 20.0, bottom: 5, right: 20.0),
                  width: double.infinity,
                  child: Text(
                    '2020',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 1.0),
                    padding: EdgeInsets.only(
                        top: 10.0, left: 20.0, bottom: 10, right: 20.0),
                    color: Colors.white,
                    child: Flex(direction: Axis.horizontal, children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            '12月',
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
                            '¥ 3400',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ])),
                Container(
                    margin: EdgeInsets.only(bottom: 1.0),
                    padding: EdgeInsets.only(
                        top: 10.0, left: 20.0, bottom: 10, right: 20.0),
                    color: Colors.white,
                    child: Flex(direction: Axis.horizontal, children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            '11月',
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
                            '¥ 3400',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ])),
                Container(
                    margin: EdgeInsets.only(bottom: 1.0),
                    padding: EdgeInsets.only(
                        top: 10.0, left: 20.0, bottom: 10, right: 20.0),
                    color: Colors.white,
                    child: Flex(direction: Axis.horizontal, children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            '10月',
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
                            '¥ 3400',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ]))
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 20.0, bottom: 5, right: 20.0),
                  width: double.infinity,
                  child: Text(
                    '2020',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 1.0),
                    padding: EdgeInsets.only(
                        top: 10.0, left: 20.0, bottom: 10, right: 20.0),
                    color: Colors.white,
                    child: Flex(direction: Axis.horizontal, children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            '12月',
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
                            '¥ 3400',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ])),
                Container(
                    margin: EdgeInsets.only(bottom: 1.0),
                    padding: EdgeInsets.only(
                        top: 10.0, left: 20.0, bottom: 10, right: 20.0),
                    color: Colors.white,
                    child: Flex(direction: Axis.horizontal, children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            '11月',
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
                            '¥ 3400',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ])),
                Container(
                    margin: EdgeInsets.only(bottom: 1.0),
                    padding: EdgeInsets.only(
                        top: 10.0, left: 20.0, bottom: 10, right: 20.0),
                    color: Colors.white,
                    child: Flex(direction: Axis.horizontal, children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            '10月',
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
                            '¥ 3400',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
