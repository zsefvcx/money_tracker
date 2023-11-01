
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money_tracker/core/core.dart';

class CustomCircleAvatar extends StatefulWidget {
  const CustomCircleAvatar({required this.uuid, super.key});

  final String uuid;

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
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: getImageFromGallery,
            child: CircleAvatar(
              backgroundColor: imgXFile==null?theme.colorScheme.secondary:null,
              backgroundImage: imgXFile==null
                  ?null
                  :FileImage(
                    File(imgXFile!.path)
                  ),
              child: imgXFile==null
                  ?const Center(child: Icon(Icons.photo_camera, size: 36, color: Colors.grey,))
                  :null,
              radius: 40,
            ),
          ),
        ),
        if(newFile)13.h,
        if(newFile)TextButton(onPressed: () {
          if (kDebugMode) {
            print(widget.uuid);
          }
          setState(() {

            newFile = false;
          });
        }, child: Text('Сохранить', style: theme.textTheme.bodyLarge,)),
      ],
    );
  }

  Future<void> getImageFromGallery() async {
    imgXFile = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      newFile = true;
    });
  }

}
