import 'package:allocation_manager_mobile/commons/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String titleButton;
  Function onPressed;

  CustomButton({super.key, required this.titleButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 63,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
          foregroundColor: MaterialStatePropertyAll(AppColors.white),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  3), // Ajuste o valor para o raio desejado
            ),
          ),
        ),
        onPressed: onPressed(),
        child: Text(titleButton),
      ),
    );
  }
}
