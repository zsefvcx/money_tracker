import 'dart:typed_data';

import 'package:equatable/equatable.dart';

abstract class APhotosEntity extends Equatable{
  final String uuid;
  final Uint8List contents;

  const APhotosEntity({required this.uuid, required this.contents});

  @override
  List<Object?> get props => [uuid, contents];

  @override
  String toString() {
    return 'APhotosEntity: {$uuid, $contents}';
  }
}
