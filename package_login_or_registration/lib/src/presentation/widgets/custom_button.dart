import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_login_or_registration/src/core/core.dart';


class CustomButton extends StatefulWidget {
  const CustomButton({
    required this.child,
    required this.focusNode, super.key,
    this.onTap,
  });

  final GestureTapCallback? onTap;
  final FocusNode focusNode;
  final Widget child;


  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final valueProcess = ValueNotifier<bool>(false);
    return GestureDetector(
      onTap: widget.onTap,
        child: RawKeyboardListener(
          focusNode: focusNode,
          onKey: (event) {
            if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
              widget.onTap?.call();
            }
          },
          child: FocusableActionDetector(
            focusNode: widget.focusNode,
            mouseCursor: SystemMouseCursors.click,
            onFocusChange: (value) => valueProcess.value=value,
            child: ValueListenableBuilder<bool>(
              valueListenable: valueProcess,
              builder: (_, value, __) {
                return Container(
                    width: CustomThemeProp.buttonSize.width,
                    height: CustomThemeProp.buttonSize.height,
                    decoration: BoxDecoration(
                      color: value?CustomThemeProp.grayLight:CustomThemeProp.violetFirm,
                      boxShadow: [
                        if(value)const BoxShadow(
                          color: CustomThemeProp.grayLight,
                          spreadRadius: 4,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(CustomThemeProp.buttonSize.height/2)),
                    ),
                    child: Center(
                      child: widget.child,
                    ));
              },
            ),
          ),
        ),
    );
  }
}
