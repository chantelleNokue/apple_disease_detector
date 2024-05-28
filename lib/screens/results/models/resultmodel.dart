// To parse this JSON data, do
//
//     final resultModel = resultModelFromMap(jsonString);

import 'dart:convert';

List<ResultModel> resultModelFromMap(String str) => List<ResultModel>.from(json.decode(str).map((x) => ResultModel.fromMap(x)));

String resultModelToMap(List<ResultModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ResultModel {
  String id;
  String reccomandation;
  String result;
  String createdAt;
  String updatedAt;
  int v;

  ResultModel({
    required this.id,
    required this.reccomandation,
    required this.result,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ResultModel.fromMap(Map<String, dynamic> json) => ResultModel(
    id: json["_id"],
    reccomandation: json["reccomandation"],
    result: json["result"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "reccomandation": reccomandation,
    "result": result,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };
}
