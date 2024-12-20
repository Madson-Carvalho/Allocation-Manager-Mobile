import 'package:flutter/material.dart';

import '../commons/app_colors.dart';

class AppSidebar extends StatefulWidget {
  const AppSidebar({super.key});

  @override
  State<AppSidebar> createState() => _AppSidebarState();
}

class _AppSidebarState extends State<AppSidebar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          child: ListView(padding: const EdgeInsets.only(top: 20), children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const ListTile(
                leading: Icon(Icons.home_filled, color: AppColors.primaryColor),
                title: Text(
                  'Página Inicial',
                  style:
                      TextStyle(fontSize: 20.0, color: AppColors.primaryColor),
                ),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/projects');
              },
              child: const ListTile(
                leading: Icon(Icons.note_alt, color: AppColors.primaryColor),
                title: Text(
                  'Projetos',
                  style: TextStyle(fontSize: 20.0, color: AppColors.primaryColor),
                ),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/employee');
              },
              child: const ListTile(
                leading: Icon(Icons.person, color: AppColors.primaryColor),
                title: Text(
                  'Colaboradores',
                  style: TextStyle(fontSize: 20.0, color: AppColors.primaryColor),
                ),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/register-project');
              },
            ),
          ]),
        ),
      ),
    );
  }
}
