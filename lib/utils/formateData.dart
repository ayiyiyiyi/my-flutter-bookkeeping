// 单条花费
class SpendDetail {
  int gender;
  String type;
  String note;
  int time;
  int cost;
  String name;
  int id;
  SpendDetail(
      {this.id,
      this.name,
      this.cost,
      this.time,
      this.note,
      this.gender,
      this.type});
  factory SpendDetail.formJson(Map<String, dynamic> json) {
    return SpendDetail(
      id: json['id'],
      name: json['name'],
      cost: json['cost'],
      time: json['time'],
      note: json['note'],
      gender: json['gender'],
      type: json['type'],
    );
  }
}

class MonthCost {
  List<SortDetail> list;
  int total;
  MonthCost({this.list, this.total});
  factory MonthCost.formJson(Map<String, dynamic> json) {
    List list = json['list'] as List;
    List<SortDetail> _list = list.map((e) => SortDetail.formJson(e)).toList();
    return MonthCost(list: _list, total: json['total']);
  }
}

class SortDetail {
  int id;
  String type;
  int percent;
  int boyRecordNum;
  int girlRecordNum;
  int boyCost;
  int girlCost;
  SortDetail(
      {this.id,
      this.type,
      this.percent,
      this.boyCost,
      this.girlCost,
      this.boyRecordNum,
      this.girlRecordNum});
  factory SortDetail.formJson(Map<String, dynamic> json) {
    return SortDetail(
        id: json['id'],
        type: json['type'],
        percent: json['percent'],
        boyRecordNum: json['boyRecordNum'],
        girlRecordNum: json['girlRecordNum'],
        boyCost: json['boyCost'],
        girlCost: json['girlCost']);
  }
}

class MessageDetail {
  int time;
  int gender;
  String content;
  String name;
  MessageDetail({this.time, this.gender, this.content, this.name});
  factory MessageDetail.formJson(Map<String, dynamic> json) {
    return MessageDetail(
        content: json['content'],
        gender: json['gender'],
        name: json['name'],
        time: json['time']);
  }
}

class YearDetail {
  int total;
  List<MonthTotal> list;
  YearDetail({this.total, this.list});
  factory YearDetail.formJson(Map<String, dynamic> json) {
    List list = json['list'] as List;
    List<MonthTotal> _list = list.map((e) => MonthTotal.formJson(e)).toList();
    return YearDetail(total: json['total'], list: _list);
  }
}

class MonthTotal {
  int month;
  int total;
  MonthTotal({this.total, this.month});
  factory MonthTotal.formJson(Map<String, dynamic> json) {
    return MonthTotal(month: json['month'], total: json['total']);
  }
}
