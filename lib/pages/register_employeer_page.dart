import 'package:allocation_manager_mobile/widgets/base_page.dart';
import 'package:allocation_manager_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import '../commons/app_colors.dart';
import '../widgets/custom_button.dart';

class RegisterEmployeerPage extends StatelessWidget {
  const RegisterEmployeerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
        body: Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Cadastro de Colaborador',
              style: TextStyle(fontSize: 24, color: AppColors.primaryColor),
            ),
          ),
          CustomTextFormField(labelText: "Nome"),
          CustomTextFormField(labelText: "E-mail"),
          CustomTextFormField(labelText: "Horas de trabalho"),
          CustomTextFormField(labelText: "Cargo"),
          CustomTextFormField(labelText: "Salario"),
          CustomTextFormField(
              labelText:
                  "Formação (Para colaboradores com múltiplas formação, separe-as por vírgulas.)"),
          CustomTextFormField(
              labelText:
                  "Especialização (Para colaboradores com múltiplas especializações, separe-as por vírgulas.)"),
          CustomButton(titleButton: 'Cadastrar', onPressed: () {})
        ],
      ),
    ));
  }
}
