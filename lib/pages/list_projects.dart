import 'package:allocation_manager_mobile/commons/app_colors.dart';
import 'package:allocation_manager_mobile/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/project_model.dart';
import '../services/api_service.dart';

class ListProjects extends StatefulWidget {
  const ListProjects({super.key});

  @override
  State<ListProjects> createState() => _ListProjectsState();
}

class _ListProjectsState extends State<ListProjects> {
  late Future<List<Project>> _futureProjects;

  @override
  void initState() {
    super.initState();
    _futureProjects = ApiService().fetchProjects();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Projetos",
              style: TextStyle(color: AppColors.primaryColor, fontSize: 22),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Project>>(
              future: _futureProjects,
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
                      'Nenhum projeto encontrado.',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  );
                } else {
                  final projects = snapshot.data!;
                  return ListView.separated(
                    itemCount: projects.length,
                    itemBuilder: (context, index) {
                      final project = projects[index];
                      return ListTile(
                        iconColor: AppColors.ligthBlue,
                        leading: const Icon(Icons.note_alt),
                        title: Text(project.name),
                        subtitle: Text(
                          'Data inicial: ${DateFormat('dd/MM/yyyy').format(project.initialDate)}\n'
                              'Data final: ${DateFormat('dd/MM/yyyy').format(project.deliveryDate)}',
                          style: const TextStyle(color: AppColors.seanBlue),
                        ),
                        trailing: Text(
                          'R\$ ${project.totalProjectValue.toStringAsFixed(2)}',
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
