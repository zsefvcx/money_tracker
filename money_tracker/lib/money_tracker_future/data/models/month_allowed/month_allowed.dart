
import 'package:json_annotation/json_annotation.dart';
import 'package:money_tracker/money_tracker_future/domain/entity/entity.dart';

part 'month_allowed.g.dart';

///Разрешенные месяца или те месяца которые хоть раз использовались
@JsonSerializable()
class MonthAllowedModel extends MonthAllowedEntity{

  const MonthAllowedModel({required super.monthEnabled});

  MonthAllowedModel copyWith({
    required Map<int, Set<int>>? monthEnabled,
  }) {
    return MonthAllowedModel(
        monthEnabled: monthEnabled??this.monthEnabled,
    );
  }

  bool status(DateTime value){
    final status = monthEnabled[value.year];
    if (status==null) {
      return false;
    } else {
      return status.contains(value.month);
    }
  }

  void add(DateTime value){
    final status = monthEnabled[value.year];
    if (status == null){
      monthEnabled[value.year] = <int>{value.month};
    } else {
      status.add(value.month);
    }
  }

  /// Connect the generated _$MonthAllowedFromJson function to the `fromJson`
  /// factory.
  factory MonthAllowedModel.fromJson(Map<String, dynamic> json) => _$MonthAllowedModelFromJson(json);

  /// Connect the generated _$MonthAllowedToJson function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MonthAllowedModelToJson(this);

  @override
  String toString() {
    return 'MonthAllowed: {$monthEnabled}';
  }
}
