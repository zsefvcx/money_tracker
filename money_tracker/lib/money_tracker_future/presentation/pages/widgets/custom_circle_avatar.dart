import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/login_future/src.dart';
import 'package:money_tracker/money_tracker_future/domain/bloc/bloc.dart';
import 'package:money_tracker/money_tracker_future/presentation/pages/widgets/widgets.dart';

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
  XFile? imgXFile;
  final ImagePicker imagePicker = ImagePicker();
  bool newFile = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final blocBloc = context.read<PhotoBloc>();
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: getImageFromGallery,
            child: BlocBuilder<PhotoBloc, PhotoBlocState>(
              builder: (context, state) {
                return state.map(
                    loading: (_) {
                      return const Center(child: CircularProgressIndicator());
                    },
                    loaded: (value) {
                      final aPhotosEntity = value.model;
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
                          backgroundImage: MemoryImage(memoryImageData) ,
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
        if(newFile)13.h,
        if(newFile)TextButton(onPressed: () async {
          final imgXFileData = imgXFile;

          if(imgXFileData == null) return;
          final completer = Completer<bool>();
          blocBloc.add(PhotoBlocEvent.write(
              uuid: widget.uuid,
              path: imgXFileData.path,
              completer: completer
          ));
          if (!await completer.future) return;
          await LoginBlocInit.changeLoadImageStatus(status: true);
          blocBloc.add(PhotoBlocEvent.init(uuid: widget.uuid));
          setState(() {
            newFile = false;
          });
        }, child: Text('Сохранить', style: theme.textTheme.bodyLarge,)),
      ],
    );
  }

  Future<void> getImageFromGallery() async {
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (imgXFile == null) return;
    setState(() {
      newFile = true;
    });
  }

}
