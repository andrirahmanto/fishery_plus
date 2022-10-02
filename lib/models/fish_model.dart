import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Fish {
  String? type;
  int? amount;

  Fish({
    required this.type,
    required this.amount,
  });

  factory Fish.fromJson(Map<String, dynamic> json) {
    return Fish(
      type: json['fish_type'],
      amount: json['fish_amount'],
    );
  }
}
