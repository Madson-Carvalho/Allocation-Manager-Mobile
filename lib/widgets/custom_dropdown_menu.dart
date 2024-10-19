import 'package:flutter/material.dart';

import '../commons/app_colors.dart';

class CustomDropdownMenu extends StatefulWidget {
  final List<String> list;
  final String labelText;
  final EdgeInsetsGeometry? padding;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final ValueChanged<String?>? onChanged;

  const CustomDropdownMenu({
    super.key,
    required this.list,
    required this.labelText,
    this.padding,
    this.keyboardType,
    this.controller,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  String? dropdownValue;
  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primaryColor),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        value: dropdownValue,
        isExpanded: true,
        iconEnabledColor: AppColors.white,
        decoration: InputDecoration(
          // fillColor: Colors.white,
          // filled: true,
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: AppColors.white),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          focusedBorder: defaultBorder,
          focusedErrorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red)),
          errorBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: Colors.red)),
          border: defaultBorder,
          disabledBorder: defaultBorder,
          enabledBorder: defaultBorder,
        ),
        hint: const Text(
          'Selecione uma opção',
          style: TextStyle(color: AppColors.white),
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(newValue);
          }
        },
        items: widget.list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
