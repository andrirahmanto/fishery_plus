import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Activation {
  String? id;
  int? idInt;
  bool? isFinish;
  num? waterLevel;
  DateTime? activationAt;
  DateTime? deactivationAt;
  int? fishAmount;
  // List<Fish> fishes;

  Activation(
      {required this.id,
      required this.idInt,
      required this.isFinish,
      required this.waterLevel,
      required this.activationAt,
      this.deactivationAt,
      this.fishAmount
      // required this.fishes,
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
        deactivationAt: json['deactivation_at'] != null
            ? DateFormat("yyyy-MM-dd hh:mm:ss").parse(json['deactivated_at'])
            : null,
        fishAmount: json['total_fish']
        // fishes:
        );
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

  String getStringDeactivationDate() =>
      DateFormat("dd-MM-yyyy").format(deactivationAt!);
}
