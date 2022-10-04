import 'package:fish/models/fish_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Activation {
  String? id;
  int? idInt;
  bool? isFinish;
  num? waterLevel;
  DateTime? activationAt;
  DateTime? deactivationAt;
  num? totalFishHarvested;
  num? totalWeightHarvested;
  int? fishAmount;
  List<Fish>? fishes;

  Activation({
    required this.id,
    required this.idInt,
    required this.isFinish,
    required this.waterLevel,
    required this.activationAt,
    this.deactivationAt,
    this.totalFishHarvested,
    this.totalWeightHarvested,
    this.fishAmount,
    this.fishes,
  });

  factory Activation.fromJson(Map<String, dynamic> json) {
    print(json);
    return Activation(
        id: json['_id'],
        idInt: json['id_int'],
        isFinish: json['isFinish'],
        waterLevel: json['water_level'],
        activationAt:
            DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['activated_at']),
        deactivationAt: json['isFinish'] == true
            ? DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['deactivated_at'])
            : null,
        totalFishHarvested: json['total_fish_harvested'],
        totalWeightHarvested: json['total_weight_harvested'],
        fishAmount: json['total_fish'],
        fishes: Fish.fromJsonList(json['fish']));
  }

  static DateTime stringToDate(String dateString) {
    DateTime parseDate = DateFormat("dd-MM-yyyy").parse(dateString);
    return parseDate;
  }

  Color getColor() {
    switch (isFinish) {
      case false:
        return Colors.green;
      case true:
        return Colors.red.shade300;
      default:
        return Colors.red.shade300;
    }
  }

  String getStatus() {
    switch (isFinish) {
      case false:
        return "Berjalan";
      case true:
        return "Selesai";
      default:
        return "Selesai";
    }
  }

  String getStringActivationDate() =>
      DateFormat("dd-MM-yyyy").format(activationAt!);

  String getStringDeactivationDate() {
    print(deactivationAt);
    if (isFinish == false) {
      return "-";
    }
    return DateFormat("dd-MM-yyyy").format(deactivationAt!);
  }

  num getRangeActivation() {
    print(deactivationAt);
    if (isFinish == false) {
      return DateTime.now().difference(activationAt!).inDays;
    }
    return deactivationAt!.difference(activationAt!).inDays;
  }
}
