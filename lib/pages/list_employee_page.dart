import 'package:allocation_manager_mobile/widgets/base_page.dart';
import 'package:allocation_manager_mobile/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../commons/app_colors.dart';
import '../model/employee_model.dart';
import '../services/api_service.dart';
import '../widgets/custom_button.dart';

class ListEmployeePage extends StatefulWidget {
  const ListEmployeePage({super.key});

  @override
  State<ListEmployeePage> createState() => _ListEmployeePageState();
}

class _ListEmployeePageState extends State<ListEmployeePage> {
  late Future<List<Employee>> _futureEmployees;

  @override
  void initState() {
    super.initState();
    _futureEmployees = ApiService().fetchEmployees();
  }

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
            child: FutureBuilder<List<Employee>>(
              future: _futureEmployees,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Erro ao carregar os dados: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text(
                      'Nenhum colaborador encontrado.',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  );
                } else {
                  final employees = snapshot.data!;
                  return ListView.separated(
                    itemCount: employees.length,
                    itemBuilder: (context, index) {
                      final employee = employees[index];
                      return ListTile(
                        iconColor: AppColors.ligthBlue,
                        leading: const Icon(Icons.note_alt),
                        title: Text(employee.name),
                        subtitle: Text(
                          'Cargo: ${(employee.specializations)}\n'
                              'Carga horária: ${(employee.workInSeconds)}',
                          style: const TextStyle(color: AppColors.seanBlue),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                    const Divider(color: AppColors.primaryColor),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
