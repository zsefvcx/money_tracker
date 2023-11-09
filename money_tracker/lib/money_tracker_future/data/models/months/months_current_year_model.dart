
import 'package:json_annotation/json_annotation.dart';
import 'package:money_tracker/money_tracker_future/domain/entity/entity.dart';

part 'months_current_year_model.g.dart';

///Разрешенные месяца или те месяца которые хоть раз использовались
@JsonSerializable()
class MonthsCurrentYearModel extends MonthsCurrentYearEntity{

  const MonthsCurrentYearModel({
    required super.uuid,
    required super.year,
    required super.months,
  });

  factory MonthsCurrentYearModel.init({
   required String uuid,
   required int year,
   required Set<int> months,
  }){
    if (year > 0 && year < 40000 && uuid != ''){
      if(months.length > 12){
        var allowed = true;
        for (final element in months) {
          if (element < 0 || element > 12){
            allowed = false;
            break;
          }
        }
        if (allowed) {
          return MonthsCurrentYearModel(uuid: uuid, year: year, months: months);
        }
      }
    }
    throw Exception('Error MonthsCurrentYearModel');
  }


  /// Connect the generated _$MonthsCurrentYearModelFromJson function to the `fromJson`
  /// factory.
  factory MonthsCurrentYearModel.fromJson(Map<String, dynamic> json) => _$MonthsCurrentYearModelFromJson(json);

  /// Connect the generated _$MonthsCurrentYearModelToJson function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MonthsCurrentYearModelToJson(this);


}
