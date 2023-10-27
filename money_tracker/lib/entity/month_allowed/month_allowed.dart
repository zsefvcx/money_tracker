
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'month_allowed.g.dart';

///Разрешенные месяца или те месяца которые хоть раз использовались
@JsonSerializable()
class MonthAllowed extends Equatable{
         //Year, Month
  final Map<int, Set<int>> monthEnabled;

  const MonthAllowed({required this.monthEnabled});

  MonthAllowed copyWith({
    required Map<int, Set<int>>? monthEnabled,
  }) {
    return MonthAllowed(
        monthEnabled: monthEnabled??this.monthEnabled,
    );
  }

  bool status(DateTime value){
    final status = monthEnabled[value.year];
    return status==null?false:status.contains(value.month);
  }

  void add(DateTime value){
    final status = monthEnabled[value.year];
    if (status == null){
      monthEnabled[value.year] = <int>{value.month};
    } else {
      status.add(value.month);
    }
  }

  /// Connect the generated [_$MonthAllowedFromJson] function to the `fromJson`
  /// factory.
  factory MonthAllowed.fromJson(Map<String, dynamic> json) => _$MonthAllowedFromJson(json);

  /// Connect the generated [_$MonthAllowedToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MonthAllowedToJson(this);

  @override
  List<Object?> get props => [monthEnabled];

  @override
  String toString() {
    return 'MonthAllowed: {${monthEnabled.toString()}}';
  }
}