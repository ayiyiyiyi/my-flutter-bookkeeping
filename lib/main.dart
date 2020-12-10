import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

import 'index.dart';
import 'config.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Memory',
        theme: new ThemeData(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            scaffoldBackgroundColor: Global.bgColor),
        home: Index());
  }
}
