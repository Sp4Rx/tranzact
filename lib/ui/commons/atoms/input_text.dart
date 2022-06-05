import 'package:flutter/material.dart';
import 'package:tranzact/ui/commons/tcolors.dart';

class InputText extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final String label;
  final String? hintText;
  final bool? obscureText;

  const InputText({
    Key? key,
    this.onChanged,
    required this.label,
    this.hintText,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        fillColor: TColors.neutral3,
        floatingLabelStyle: const TextStyle(height: 4, color: TColors.neutral8),
        filled: true,
        labelText: label,
        labelStyle: const TextStyle(
          color: TColors.neutral8,
        ),
        hintStyle: const TextStyle(
          color: TColors.neutral8,
        ),
        hintText: hintText,
      ),
    );
  }
}
