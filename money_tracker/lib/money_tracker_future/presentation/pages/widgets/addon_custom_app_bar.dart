import 'package:flutter/material.dart';

class AddonCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;
  final Color? color;

  const AddonCustomAppBar({
    required this.child,
    this.height = kToolbarHeight,
    this.color,
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: color,
      child: child,
    );
  }
}
