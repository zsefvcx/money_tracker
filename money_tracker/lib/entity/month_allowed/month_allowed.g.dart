// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month_allowed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthAllowed _$MonthAllowedFromJson(Map<String, dynamic> json) => MonthAllowed(
      monthEnabled: (json['monthEnabled'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k), (e as List<dynamic>).map((e) => e as int).toSet()),
      ),
    );

Map<String, dynamic> _$MonthAllowedToJson(MonthAllowed instance) =>
    <String, dynamic>{
      'monthEnabled': instance.monthEnabled
          .map((k, e) => MapEntry(k.toString(), e.toList())),
    };
