import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_tracker/core/core.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    this.keyboardType,
    this.validator,
    this.focusNode,
    this.nextFocusNode,
    this.controller,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.autofocus = false,
    this.maxLength,
    this.suffixIcon,
    this.onChanged,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.inputFormatters,
    this.onEditingComplete,
    super.key});

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final FormFieldValidator<String?>? validator;
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final bool autofocus;
  final TextInputType? keyboardType;
  final int? maxLength;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onEditingComplete;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final valueProcess = ValueNotifier<(bool, bool)>((false, widget.obscureText));
    return FocusableActionDetector(
      focusNode: focusNode,
      onFocusChange: (focused) {
        if(focused){
          FocusScope.of(context).requestFocus(widget.focusNode);
        } else {
          //FocusScope.of(context).requestFocus(widget.nextFocusNode);
         //widget.nextFocusNode?.requestFocus();
        }
        valueProcess.value = (!valueProcess.value.$1, valueProcess.value.$2);
      },
      child: ValueListenableBuilder<(bool, bool)>(
        valueListenable: valueProcess,
        builder: (_, value, __) {
          return TextFormField(
            onEditingComplete: () {
              FocusScope.of(context).requestFocus(widget.nextFocusNode);
              widget.nextFocusNode?.requestFocus();
              final function = widget.onEditingComplete;
              if(function != null) {
                function();
              }
            },
            inputFormatters: widget.inputFormatters,
            onChanged: widget.onChanged,
            autofocus: widget.autofocus,
            focusNode: widget.focusNode,
            style: theme.textTheme.bodyMedium,
            cursorColor: CustomThemeProp.violetFirm,
            controller: widget.controller,
            mouseCursor: SystemMouseCursors.text,
            validator: widget.validator,
            obscureText: value.$2,
            obscuringCharacter: '*',
            maxLength: widget.maxLength,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              floatingLabelStyle: theme.inputDecorationTheme.floatingLabelStyle?.copyWith(
                color: (widget.focusNode?.hasFocus ?? true)?CustomThemeProp.violetFirm:null,
              ),
              border: widget.border,
              focusedBorder: widget.focusedBorder,
              enabledBorder: widget.enabledBorder,
              labelText: widget.labelText,
              hintText: widget.hintText,
              suffixIconColor: (widget.focusNode?.hasFocus ?? true)?CustomThemeProp.violetFirm:null,
              prefixIconColor: (widget.focusNode?.hasFocus ?? true)?CustomThemeProp.violetFirm:null,
              suffixIcon: widget.suffixIcon ?? (widget.obscureText?IconButton(
                icon: Icon(value.$2?Icons.visibility:Icons.visibility_off),
                onPressed: () {
                  valueProcess.value = (valueProcess.value.$1, !valueProcess.value.$2);
                  FocusScope.of(context).requestFocus(widget.focusNode);
                  widget.focusNode?.requestFocus();
                },
              ):null),
            ),
          );
        },
      ),
    );
  }
}
