
part 'photo_bloc.dart';


//@injectable
class PhotoModelData {

  final bool timeOut;
  final AUsersEntity data;
  final bool error;
  final String e;

  bool get isLoaded => data.users.isNotEmpty;
  bool get isTimeOut => timeOut;
  bool get isError => error;

  const UsersModelData({
    required this.data,
    required this.e,
    required this.timeOut,
    required this.error,
  });

  UsersModelData copyWith({
    AUsersEntity? data,
    String? e,
    bool? timeOut,
    bool? error,
  }){
    return UsersModelData(
      data: data ?? this.data,
      e: e ?? this.e,
      timeOut: timeOut ?? this.timeOut,
      error: error ?? this.error,
    );
  }
}