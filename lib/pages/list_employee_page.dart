import 'package:allocation_manager_mobile/widgets/base_page.dart';
import 'package:allocation_manager_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../commons/app_colors.dart';
import '../widgets/custom_button.dart';

class ListEmployeePage extends StatelessWidget {
  const ListEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Colaboradores",
              style: TextStyle(color: AppColors.primaryColor, fontSize: 22),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  iconColor: AppColors.primaryColor,
                  leading: const Icon(Icons.person),
                  title: const Text('Nome Colaborador',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      text: 'Nome do projeto\n',
                      style: const TextStyle(color: AppColors.primaryColorSofty, fontSize:  14),
                      children: [
                        TextSpan(
                          text: 'Data inicial: ${DateFormat('dd/MM/yyyy hh:mm:ss').format(DateTime.now())}\n',
                          style: const TextStyle(fontSize: 12),
                        ),
                        TextSpan(
                          text: 'Data final: ${DateFormat('dd/MM/yyyy hh:mm:ss').format(DateTime.now())}',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Divider(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
