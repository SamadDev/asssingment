import 'package:flutter/material.dart';
import 'package:flutter_dashboard/core/theme.dart';
import 'package:flutter_dashboard/features/share/widgets/text_widget.dart';

class PrimaryTextFieldWidget extends StatelessWidget {
  final String label;
  final String? initialValue;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  const PrimaryTextFieldWidget({
    super.key,
    required this.label,
    this.initialValue,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    );
    return TextFormField(
      cursorColor: kcWhite,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: textStyle(context,
            color: kcDarkGreyLight, fontWeight: FontWeight.w400),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        fillColor: kcPrimary,
        filled: true,
      ),
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
