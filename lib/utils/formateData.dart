// 单条花费
class SpendDetail {
  int gender;
  String type;
  String note;
  int time;
  double cost;
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
  double total;
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
  double percent;
  int boyRecordNum;
  int girlRecordNum;
  double boyCost;
  double girlCost;
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
