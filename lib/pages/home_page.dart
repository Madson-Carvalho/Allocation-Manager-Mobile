import 'package:allocation_manager_mobile/widgets/base_page.dart';
import 'package:flutter/material.dart';
import '../commons/app_colors.dart';
import '../model/employee_model.dart';
import '../model/project_model.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  late Future<List<Project>> _futureProjects;
  late Future<List<Employee>> _futureEmployees;

  @override
  void initState() {
    super.initState();
    _futureProjects = ApiService().fetchProjects();
    _futureEmployees = ApiService().fetchEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Resumo',
                style: TextStyle(color: AppColors.primaryColor, fontSize: 24),
              ),
            ),
            _buildSection(
              title: 'Projetos',
              futureData: _futureProjects,
              itemBuilder: (project) => ListTile(
                leading: const Icon(Icons.note_alt, color: AppColors.white, size: 35),
                title: Text(
                  project.name,
                  style: const TextStyle(color: AppColors.white),
                ),
                subtitle: Text(
                  'Tempo de Projeto',
                  style: const TextStyle(color: AppColors.white),
                ),
                trailing: Text(
                  '${project.projectHours}h',
                  style: const TextStyle(color: AppColors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 8),
            _buildSection(
              title: 'Colaboradores',
              futureData: _futureEmployees,
              itemBuilder: (employee) => ListTile(
                leading: const Icon(Icons.person, color: AppColors.white, size: 35),
                title: Text(
                  employee.name,
                  style: const TextStyle(color: AppColors.white),
                ),
                subtitle: Text(
                  'Horas Disponíveis',
                  style: const TextStyle(color: AppColors.white),
                ),
                trailing: Text(
                  '${employee.workInSeconds - employee.allocatedHours}h',
                  style: const TextStyle(color: AppColors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection<T>({
    required String title,
    required Future<List<T>> futureData,
    required Widget Function(T) itemBuilder,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                title,
                style: const TextStyle(color: AppColors.white, fontSize: 20),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: FutureBuilder<List<T>>(
                future: futureData,
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
                        'Nenhum dado encontrado.',
                        style: TextStyle(color: AppColors.white),
                      ),
                    );
                  } else {
                    final items = snapshot.data!;
                    return ListView.separated(
                      itemCount: items.length,
                      itemBuilder: (context, index) => itemBuilder(items[index]),
                      separatorBuilder: (context, index) =>
                      const Divider(color: AppColors.white),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
