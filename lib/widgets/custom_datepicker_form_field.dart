import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../commons/app_colors.dart';

class CustomDatePickerFormField extends StatefulWidget {
  final String labelText;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final Widget? suffixIcon;

  const CustomDatePickerFormField({
    super.key,
    this.padding,
    required this.labelText,
    this.controller,
    this.suffixIcon,
  });

  @override
  State<CustomDatePickerFormField> createState() =>
      _CustomDatePickerFormFieldState();
}

class _CustomDatePickerFormFieldState extends State<CustomDatePickerFormField> {
  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor),
  );

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller?.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        readOnly: true,
        style: const TextStyle(color: AppColors.primaryColor),
        decoration: InputDecoration(
          labelStyle: const TextStyle(color: AppColors.primaryColor),
          suffixIcon: widget.suffixIcon ??
              const Icon(
                Icons.calendar_today,
                color: AppColors.primaryColor,
              ),
          labelText: widget.labelText,
          focusedBorder: defaultBorder,
          focusedErrorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          errorBorder: defaultBorder.copyWith(
            borderSide: const BorderSide(color: Colors.red),
          ),
          border: defaultBorder,
          disabledBorder: defaultBorder,
          enabledBorder: defaultBorder,
        ),
        onTap: () => _selectDate(context),
      ),
    );
  }
}
