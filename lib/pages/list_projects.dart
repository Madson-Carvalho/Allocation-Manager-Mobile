import 'package:allocation_manager_mobile/commons/app_colors.dart';
import 'package:allocation_manager_mobile/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListProjects extends StatefulWidget {
  const ListProjects({super.key});

  @override
  State<ListProjects> createState() => _ListProjectsState();
}

class _ListProjectsState extends State<ListProjects> {
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
            child: ListView.separated(
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  iconColor: AppColors.ligthBlue,
                  leading: const Icon(Icons.note_alt),
                  title: const Text('Nome projeto'),
                  subtitle: Text(
                    'Data inicial ${DateFormat('dd/MM/yyyy hh:mm:ss').format(DateTime.now())} \nData final ${DateFormat('dd/MM/yyyy hh:mm:ss').format(DateTime.now())}',
                    style: const TextStyle(color: AppColors.seanBlue),
                  ),
                  trailing: const Text(
                    '- R\$ 60000',
                    style: TextStyle(color: AppColors.seanBlue),
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
