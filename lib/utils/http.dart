import 'package:dio/dio.dart';

import './formateData.dart';

var dio = Dio();
Future<MonthCost> getMonthCost() async {
  try {
    Response response = await dio
        .get('http://rap2api.taobao.org/app/mock/269346/tally/month/list');
    return MonthCost.formJson(response.data);
  } catch (e) {
    print(e);
  }
}

Future<List<MessageDetail>> getMessageList() async {
  try {
    Response response = await dio
        .get('http://rap2api.taobao.org/app/mock/269346/tally/message/list');
    return (response.data as List)
        .map((e) => MessageDetail.formJson(e))
        .toList();
  } catch (e) {
    print(e);
    return [];
  }
}
