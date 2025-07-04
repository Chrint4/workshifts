// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:workshifts/common/constants.dart';

extension DateOnlyCompare on DateTime {
  bool isSameDay(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }

  bool get isToday => this.isSameDay(DateTime.now());

  String toIsoDateString() {
    return "${this.year}-${this.month.toString().padLeft(2, '0')}-${this.day.toString().padLeft(2, '0')}";
  }
}

class VerticalSpacerLine extends StatelessWidget {
  const VerticalSpacerLine({super.key, this.amount, this.height, this.width});
  final double? amount;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: (height != null) ? height! * (amount ?? 1) : height,
      child: Container(color: kBackgroundCol),
    );
  }
}

class HorizontalSpacerLine extends StatelessWidget {
  const HorizontalSpacerLine({super.key, this.amount, this.height, this.width});
  final double? amount;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: (width != null) ? width! * (amount ?? 1) : width,
      child: Container(color: kBackgroundCol),
    );
  }
}
