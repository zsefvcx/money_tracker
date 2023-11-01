
part of 'photo_bloc.dart';

//@injectable
class PhotoModelData {

  final bool timeOut;
  final APhotosEntity? data;
  final bool error;
  final String e;

  bool get isTimeOut => timeOut;
  bool get isError => error;

  const PhotoModelData({
    required this.data,
    required this.e,
    required this.timeOut,
    required this.error,
  });

  PhotoModelData copyWithData({
    required APhotosEntity? data,
    String? e,
    bool? timeOut,
    bool? error,
  }){
    return PhotoModelData(
      data: data,
      e: e ?? this.e,
      timeOut: timeOut ?? this.timeOut,
      error: error ?? this.error,
    );
  }
}
