
import 'package:equatable/equatable.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';

class StatusUserProp  extends Equatable{

  final String uuid;
  final String eMail;
  final bool loadImage;
  final MonthCurrent monthCurrent;

  const StatusUserProp({
    required this.uuid,
    required this.eMail,
    required this.loadImage,
    required this.monthCurrent
  });

  StatusUserProp copyWith({
    String? uuid,
    String? eMail,
    bool? loadImage,
    MonthCurrent? monthCurrent
  }) {
    return StatusUserProp(
      uuid: uuid ?? this.uuid,
      eMail: eMail ?? this.eMail,
      loadImage: loadImage ?? this.loadImage,
      monthCurrent: monthCurrent ?? this.monthCurrent,
    );
  }

  @override
  List<Object?> get props => [uuid, eMail, loadImage, monthCurrent];

  @override
  String toString() {
    return 'StatusUserProp: {$uuid, $eMail, $loadImage, $monthCurrent}';
  }
}
