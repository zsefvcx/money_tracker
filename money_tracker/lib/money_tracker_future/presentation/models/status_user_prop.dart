
import 'package:flutter/material.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';

@immutable
class StatusUserProp{

  final String uuid;
  final String eMail;
  final bool loadImage;
  final MonthCurrent monthCurrent;

//<editor-fold desc="Data Methods">
  const StatusUserProp({
    required this.uuid,
    required this.eMail,
    required this.loadImage,
    required this.monthCurrent,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StatusUserProp &&
          runtimeType == other.runtimeType &&
          uuid == other.uuid &&
          eMail == other.eMail &&
          loadImage == other.loadImage &&
          monthCurrent == other.monthCurrent);

  @override
  int get hashCode =>
      uuid.hashCode ^
      eMail.hashCode ^
      loadImage.hashCode ^
      monthCurrent.hashCode;

  @override
  String toString() {
    return 'StatusUserProp{ uuid: $uuid, eMail: $eMail, loadImage: $loadImage, monthCurrent: $monthCurrent,}';
  }

  StatusUserProp copyWith({
    String? uuid,
    String? eMail,
    bool? loadImage,
    MonthCurrent? monthCurrent,
  }) {
    return StatusUserProp(
      uuid: uuid ?? this.uuid,
      eMail: eMail ?? this.eMail,
      loadImage: loadImage ?? this.loadImage,
      monthCurrent: monthCurrent ?? this.monthCurrent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'eMail': eMail,
      'loadImage': loadImage,
      'monthCurrent': monthCurrent,
    };
  }

  factory StatusUserProp.fromMap(Map<String, dynamic> map) {
    return StatusUserProp(
      uuid: map['uuid'] as String,
      eMail: map['eMail'] as String,
      loadImage: map['loadImage'] as bool,
      monthCurrent: map['monthCurrent'] as MonthCurrent,
    );
  }

//</editor-fold>
}
