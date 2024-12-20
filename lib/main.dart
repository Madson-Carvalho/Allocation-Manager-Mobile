import 'package:allocation_manager_mobile/commons/app_colors.dart';
import 'package:allocation_manager_mobile/pages/home_page.dart';
import 'package:allocation_manager_mobile/pages/list_projects.dart';
import 'package:allocation_manager_mobile/pages/list_employee_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/projects': (context) => const ListProjects(),
        '/employee': (context) => const ListEmployeePage(),
      },
    );
  }
}
