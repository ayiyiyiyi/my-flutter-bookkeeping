import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localCostFile async {
  final path = await _localPath;
  return File('$path/dailyCosts.json');
}

Future writeLocalCost(String data) async {
  final file = await _localCostFile;

  // Write the file.
  return file.writeAsString('$data');
}

Future readLocalCost() async {
  try {
    final file = await _localCostFile;

    // Read the file.
    String result = await file.readAsString();
    return result;
  } catch (e) {
    return '';
  }
}

Future<File> get _localMessageFile async {
  final path = await _localPath;
  return File('$path/loveMessage.json');
}

Future writeLocalMesage(String data) async {
  final file = await _localMessageFile;

  // Write the file.
  return file.writeAsString('$data');
}

Future readLocalMessage() async {
  try {
    final file = await _localMessageFile;

    // Read the file.
    String result = await file.readAsString();
    return result;
  } catch (e) {
    return '';
  }
}
