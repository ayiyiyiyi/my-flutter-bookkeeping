import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localCostFile async {
  final path = await _localPath;
  return File('$path/dailyCost1.txt');
}

Future writeCost(String data) async {
  final file = await _localCostFile;

  // Write the file.
  return file.writeAsString('$data');
}

Future readCost() async {
  try {
    final file = await _localCostFile;

    // Read the file.
    String result = await file.readAsString();
    return result;
  } catch (e) {
    return '';
  }
}
