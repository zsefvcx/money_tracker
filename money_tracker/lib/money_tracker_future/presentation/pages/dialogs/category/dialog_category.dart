
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:money_tracker/core/core.dart';
import 'package:money_tracker/generated/l10n.dart';
import 'package:money_tracker/money_tracker_future/core/core.dart';

class DialogCategory extends StatefulWidget {
  const DialogCategory({
    required this.icon,
    this.categoryExpenses,
    this.addCategory = true,
    super.key
  });

  final CategoryExpenses? categoryExpenses;
  final bool addCategory;
  final Widget icon;

  @override
  State<DialogCategory> createState() => _DialogCategoryState();
}

class _DialogCategoryState extends State<DialogCategory> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: '0');

  final TextEditingController _nameController= TextEditingController();
  final TextEditingController _colorController= TextEditingController();
  final TextEditingController _hexInputController = TextEditingController();

  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNodeSecond = FocusNode();
  final FocusNode _focusNodeThree = FocusNode();
  final _valueNotifierColorPickerVisible = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _nameController.dispose();
    _colorController.dispose();
    _focusNode.dispose();
    _focusNodeSecond.dispose();
    _focusNodeThree.dispose();
    _valueNotifierColorPickerVisible.dispose();
    _hexInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (!widget.addCategory){
      final categoryExpenses = widget.categoryExpenses;
      if (categoryExpenses != null){
        _nameController.text = categoryExpenses.name;
        _colorController.text = categoryExpenses.colorHex;
        _hexInputController.text = '#${categoryExpenses.colorHex}';
      }
    }
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.addCategory?S.of(context).addCategory:S.of(context).changeCategory,
                style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 20
                ),),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30, top: 21,
                  left: 25, right: 25,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        controller: _nameController,
                        autofocus: true,
                        focusNode: _focusNode,
                        nextFocusNode: _focusNodeSecond,
                        keyboardType: TextInputType.text,
                        labelText: S.of(context).name,
                        hintText: S.of(context).enterTheName,
                        validator: (value) => (
                            value != null &&
                                value.isNotEmpty
                        )
                            ?null
                            :S.of(context).fieldIsEmpty,
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: _valueNotifierColorPickerVisible,
                        builder: (_, value, __) {
                          return Column(
                            children: [
                              CustomTextFormField(
                                controller: _colorController,
                                focusNode: _focusNodeSecond,
                                nextFocusNode: _focusNodeThree,
                                keyboardType: TextInputType.text,
                                labelText: S.of(context).color,
                                hintText: S.of(context).enterColor,
                                maxLength: 6,
                                validator: (value) =>
                                (   value != null &&
                                    value.length==6 &&
                                    RegExp('[A-Fa-f0-9]{6}').hasMatch(value)
                                )
                                    ?null
                                    :S.of(context).errorLengthMustBe6SymbolsInHexFormat,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _valueNotifierColorPickerVisible.value =
                                    !_valueNotifierColorPickerVisible.value;
                                  },
                                  icon: Icon(!value
                                      ?Icons.color_lens_outlined
                                      :Icons.color_lens_rounded),
                                ),
                              ),
                              Visibility(
                                visible: value,
                                child: ColorPicker(
                                  hexInputController: _hexInputController,
                                  colorPickerWidth: 200,
                                  pickerColor: Colors.white,
                                  enableAlpha: false,
                                  paletteType: PaletteType.hueWheel,
                                  onColorChanged: (color){
                                    _colorController.text =
                                        color.value.toRadixString(16).substring(2,8);
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 30,
                  left: 25, right: 25,
                ),
                child: Column(
                  children: [
                    ElevatedButton(onPressed: () {
                      final cSt = formKey.currentState;
                      final categoryExpenses = widget.categoryExpenses;
                     // throw Exception('Error search Key');
                      CategoryExpenses? localCategoryExpenses;
                      if(cSt != null && cSt.validate()) {
                        localCategoryExpenses = widget.addCategory?CategoryExpenses(
                          name: _nameController.text,
                          colorHex: _colorController.text,
                        )
                            :CategoryExpenses(
                          id: categoryExpenses?.id,
                          name: _nameController.text,
                          colorHex: _colorController.text,
                        );
                        if(widget.addCategory)_nameController.text = '';
                        Navigator.pop(context,
                            localCategoryExpenses
                        );
                      }
                    },
                      child: Text(widget.addCategory
                          ?S.of(context).add
                          :S.of(context).modifi),
                      style: theme.elevatedButtonTheme.style?.copyWith(
                        minimumSize: const MaterialStatePropertyAll(Size(
                            double.maxFinite,50
                        )),
                      ),
                      focusNode: _focusNodeThree,
                    ),
                    15.h,
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, null);
                        _nameController.text = '';
                      },
                      child: Text(S.of(context).close, style: theme.dialogTheme.contentTextStyle),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
