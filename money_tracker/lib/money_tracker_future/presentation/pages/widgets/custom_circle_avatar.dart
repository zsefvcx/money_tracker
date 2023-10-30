
import 'package:flutter/material.dart';

//https://youtu.be/_wH03aigwbg

class CustomCircleAvatar extends StatefulWidget {
  const CustomCircleAvatar({super.key});

  @override
  State<CustomCircleAvatar> createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => showDialog<String>(
          context: context,
          builder: (context) => Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('This is a typical dialog.'),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
          ),
        ),
        child: CircleAvatar(
          backgroundColor: theme.colorScheme.secondary,
          child: const Center(child: Icon(Icons.photo_camera, size: 36, color: Colors.grey,)),
          radius: 40,
        ),
      ),
    );
  }
}
