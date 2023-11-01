import 'dart:typed_data';

abstract class APhotosEntity{
  final String uuid;
  final Uint8List contents;

  APhotosEntity({required this.uuid, required this.contents});
}
