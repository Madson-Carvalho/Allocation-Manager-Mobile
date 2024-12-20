import 'package:allocation_manager_mobile/widgets/base_page.dart';
import 'package:flutter/material.dart';

import '../commons/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
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
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Projetos',
                        style: TextStyle(color: AppColors.white, fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.note_alt, color: AppColors.white, size : 35,),
                            title: Text(
                              'Projeto ${index + 1}',
                              style: const TextStyle(color: AppColors.white),
                            ),
                            subtitle: const Text(
                              'Tempo de Projeto',
                              style: TextStyle(color: AppColors.white),
                            ),
                            trailing: const Text(
                              '60h',
                              style: TextStyle(color: AppColors.white, fontSize: 16),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                        const Divider(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Colaboradores Disponiveis',
                        style: TextStyle(color: AppColors.white, fontSize: 20,),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.person, color: AppColors.white, size: 35,),
                            title: Text(
                              'Nome do colaborador ${index + 1}',
                              style: const TextStyle(color: AppColors.white),
                            ),
                            subtitle: const Text(
                              'Tempo Disponivel',
                              style: const TextStyle(color: AppColors.white),
                            ),
                            trailing: const Text(
                              '3h',
                              style: const TextStyle(color: AppColors.white, fontSize: 16),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                        const Divider(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}