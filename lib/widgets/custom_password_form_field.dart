import 'package:flutter/material.dart';

import '../commons/app_colors.dart';
import 'custom_text_form_field.dart';

class CustomPasswordField extends StatefulWidget {
  final String labelText;
  final EdgeInsetsGeometry? padding;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const CustomPasswordField(
      {super.key,
      required this.labelText,
      this.padding,
      this.keyboardType,
      this.controller});

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      obscureText: isHidden,
      padding: widget.padding,
      labelText: widget.labelText,
      suffixIcon: InkWell(
        borderRadius: BorderRadius.circular(23),
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
        child: Icon(
          isHidden ? Icons.visibility : Icons.visibility_off,
          color: AppColors.white,
        ),
      ),
    );
  }
}
