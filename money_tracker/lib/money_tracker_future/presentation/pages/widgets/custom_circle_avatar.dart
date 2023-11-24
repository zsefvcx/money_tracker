import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/login_future/src.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';


class CustomCircleAvatar extends StatefulWidget {
  const CustomCircleAvatar({
    required this.loadImage,
    required this.uuid,
    super.key
  });

  final String uuid;
  final bool loadImage;

  @override
  State<CustomCircleAvatar> createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {

  final ImagePicker imagePicker = ImagePicker();
  XFile? imgXFile;
  final _valueNewFile = ValueNotifier<bool>(false);

  @override
  void dispose() {
    super.dispose();
    _valueNewFile.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final photoBloc = context.read<PhotoBloc>();
    if(!photoBloc.photoModelData.isLoaded) {
      if (widget.loadImage) {
        photoBloc.add(PhotoBlocEvent.init(uuid: widget.uuid));
      } else {
        photoBloc.add(const PhotoBlocEvent.init(uuid: ''));
      }
    }
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: getImageFromGallery,
            child: BlocBuilder<PhotoBloc, PhotoBlocState>(
              builder: (_, state) {
                return state.map(
                    loading: (_) {
                      return const Center(child: CircularProgressIndicator());
                    },
                    loaded: (value) {
                      final aPhotosEntity = value.entity;
                      final memoryImageData = aPhotosEntity?.contents;

                      final path = imgXFile?.path;
                      if(path != null){
                        return CircleAvatar(
                          backgroundColor: theme.colorScheme.secondary,
                          backgroundImage: FileImage(File(path)),
                          radius: 40,
                        );
                      } else if(memoryImageData != null){
                        return CircleAvatar(
                          backgroundColor: theme.colorScheme.secondary,
                          backgroundImage: MemoryImage(memoryImageData),
                          radius: 40,
                        );
                      } else {
                        return CircleAvatar(
                          backgroundColor: theme.colorScheme.secondary,
                          child: const Center(child: Icon(
                            Icons.photo_camera, size: 36, color: Colors.grey,)),
                          radius: 40,
                        );
                      }
                    },
                    error: (_) {
                      return CircleAvatar(
                        backgroundColor: theme.colorScheme.secondary,
                        child: const Center(
                          child: Icon(
                            Icons.error,
                          ),
                        ),
                        radius: 40,
                      );
                    },
                    timeOut: (_) {
                      return CircleAvatar(
                        backgroundColor: theme.colorScheme.secondary,
                        child: const Center(
                          child: Icon(
                            Icons.bedtime_off_outlined,
                          ),
                        ),
                        radius: 40,
                      );
                    }
                );
              },
            ),
          ),
        ),
        ValueListenableBuilder(
            valueListenable: _valueNewFile,
            builder: (_, value, __) {

              return Visibility(
                visible: value,
                child: Column(children: [
                  13.h,
                  TextButton(onPressed: () async {
                    final imgXFileData = imgXFile;
                    if(imgXFileData == null) return;
                    final completer = Completer<bool>();
                    photoBloc.add(PhotoBlocEvent.write(
                        uuid: widget.uuid,
                        path: imgXFileData.path,
                        completer: completer
                    ));
                    if (!await completer.future) return;
                    await LoginBlocInit.changeLoadImageStatus(status: true);
                    _valueNewFile.value = false;
                  }, child: Text(S.of(context).save, style: theme.textTheme.bodyLarge,)),
                ],),
              );
            },),
      ],
    );
  }

  Future<void> getImageFromGallery() async {
    final blocBloc = context.read<PhotoBloc>();
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imgXFile == null) return;
    blocBloc.add(const PhotoBlocEvent.read(uuid: ''));
    _valueNewFile.value = true;
  }
}
