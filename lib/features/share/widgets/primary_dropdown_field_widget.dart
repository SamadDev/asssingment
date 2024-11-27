import 'package:flutter/material.dart';
import 'package:flutter_dashboard/features/share/widgets/text_widget.dart';

import '../../../core/theme.dart';

class PrimaryDropdownFieldWidget extends StatelessWidget {
  final String label;
  final String? initialValue;
  final List<DropdownMenuItem<String>> items;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool enabled;
  const PrimaryDropdownFieldWidget({
    super.key,
    required this.label,
    required this.items,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
    return DropdownButtonFormField(
      dropdownColor: kcDarkPrimary,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: textStyle(context,color: kcDarkGreyLight),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        fillColor: kcPrimary,
        filled: true,
      ),
      value: initialValue,
      onChanged: onChanged,
      validator: validator,
      items: items,
    );
  }
}
