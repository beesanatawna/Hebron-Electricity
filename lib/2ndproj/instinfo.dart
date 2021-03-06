// To parse this JSON data, do
//
//     final instinfo = instinfoFromJson(jsonString);

import 'dart:convert';

List<Instinfo> instinfoFromJson(String str) =>
    List<Instinfo>.from(json.decode(str).map((x) => Instinfo.fromJson(x)));

String instinfoToJson(List<Instinfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Instinfo {
  Instinfo({
    required this.custId,
    required this.paraVn,
    required this.feeKod,
    required this.feeName,
    required this.feeTimes,
    required this.feeValue,
    required this.calTimes,
    required this.lastSellId,
    required this.lastFeeTimes,
    required this.wayOfDeduct,
    required this.startDate,
  });

//Json['xxx']==null? "AnyText" : Json['xxx']
  String custId;
  num paraVn;
  String feeKod;
  String feeName;
  int feeTimes;
  String feeValue;
  int calTimes;
  var lastSellId;
  var lastFeeTimes;
  String wayOfDeduct;
  StartDate startDate;

  factory Instinfo.fromJson(Map<String, dynamic> json) => Instinfo(
        custId: json["CustID"] == null ? " " : json["CustID"],
        paraVn: json["Para_vn"] == null ? 0 : json["Para_vn"],
        feeKod: json["FeeKod"] == null ? " " : json["FeeKod"],
        feeName: json["FeeName"] == null ? " " : json["FeeName"],
        feeTimes: json["FeeTimes"] == null ? 0 : json["FeeTimes"],
        feeValue: json["FeeValue"] == null ? " " : json["FeeValue"],
        calTimes: json["CalTimes"] == null ? 0 : json["CalTimes"],
        lastSellId: json["LastSellID"] == null ? " " : json["LastSellID"],
        lastFeeTimes: json["LastFeeTimes"] == null ? 0 : json["LastFeeTimes"],
        wayOfDeduct: json["WayOfDeduct"] == null ? " " : json["WayOfDeduct"],
        startDate: StartDate.fromJson(json["StartDate"]),
      );

  Map<String, dynamic> toJson() => {
        "CustID": custId,
        "Para_vn": paraVn,
        "FeeKod": feeKod,
        "FeeName": feeName,
        "FeeTimes": feeTimes,
        "FeeValue": feeValue,
        "CalTimes": calTimes,
        "LastSellID": lastSellId.toString(),
        "LastFeeTimes": lastFeeTimes,
        "WayOfDeduct": wayOfDeduct,
        "StartDate": startDate.toJson(),
      };
}

class Json {}

class StartDate {
  StartDate({
    required this.date,
    required this.timezoneType,
    required this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  factory StartDate.fromJson(Map<String, dynamic> json) => StartDate(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}
