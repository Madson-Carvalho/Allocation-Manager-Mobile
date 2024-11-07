import 'package:flutter/material.dart';

import '../commons/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final EdgeInsetsGeometry? padding;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool? obscureText;

  const CustomTextFormField({
    super.key,
    this.padding,
    required this.labelText,
    this.keyboardType,
    this.controller,
    this.suffixIcon,
    this.obscureText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: AppColors.primaryColor),
          suffixIcon: widget.suffixIcon,
          labelText: widget.labelText,
          focusedBorder: defaultBorder,
          focusedErrorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red)),
          errorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red)),
          border: defaultBorder,
          disabledBorder: defaultBorder,
          enabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
