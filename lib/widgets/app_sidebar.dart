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
          child: ListView(padding: EdgeInsets.zero, children: const [
            ListTile(
              leading: Icon(Icons.person, color: AppColors.primaryColor),
              title: Text(
                'Colaboradores',
                style: TextStyle(fontSize: 20.0, color: AppColors.primaryColor),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.note_alt, color: AppColors.primaryColor),
              title: Text(
                'Projetos',
                style: TextStyle(fontSize: 20.0, color: AppColors.primaryColor),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
