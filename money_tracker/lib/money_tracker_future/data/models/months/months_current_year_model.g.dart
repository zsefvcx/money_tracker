// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'months_current_year_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MonthsCurrentYearModel _$MonthsCurrentYearModelFromJson(
        Map<String, dynamic> json) =>
    MonthsCurrentYearModel(
      uuid: json['uuid'] as String,
      year: json['year'] as int,
      months: (json['months'] as List<dynamic>).map((e) => e as int).toSet(),
    );

Map<String, dynamic> _$MonthsCurrentYearModelToJson(
        MonthsCurrentYearModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'year': instance.year,
      'months': instance.months.toList(),
    };
