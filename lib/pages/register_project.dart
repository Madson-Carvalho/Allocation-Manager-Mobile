import 'package:allocation_manager_mobile/commons/app_colors.dart';
import 'package:allocation_manager_mobile/widgets/base_page.dart';
import 'package:allocation_manager_mobile/widgets/custom_button.dart';
import 'package:allocation_manager_mobile/widgets/custom_datepicker_form_field.dart';
import 'package:allocation_manager_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterProject extends StatefulWidget {
  const RegisterProject({super.key});

  @override
  State<RegisterProject> createState() => _RegisterProjectState();
}

class _RegisterProjectState extends State<RegisterProject> {
  final TextEditingController _initialDateController = TextEditingController();
  final TextEditingController _finalDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Cadastrar projeto",
              style: TextStyle(color: AppColors.primaryColor, fontSize: 22),
            ),
          ),
          const CustomTextFormField(
            labelText: 'Nome',
          ),
          const CustomTextFormField(
            labelText: 'Horas de projeto',
          ),
          const CustomTextFormField(
            labelText: 'Coordenador do projeto',
          ),
          const CustomTextFormField(
            labelText: 'Fonte financiadora',
          ),
          const CustomTextFormField(
            labelText: 'Valor total do projeto',
          ),
          CustomDatePickerFormField(
            labelText: 'Data inicial',
            controller: _initialDateController,
          ),
          CustomDatePickerFormField(
            labelText: 'Data final',
            controller: _finalDateController,
          ),
          CustomButton(titleButton: 'Salvar', onPressed: (){})
        ],
      ),
    );
  }
}
