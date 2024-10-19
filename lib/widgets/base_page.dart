import 'package:allocation_manager_mobile/commons/app_colors.dart';
import 'package:flutter/material.dart';

import 'app_sidebar.dart';

class BasePage extends StatefulWidget {
  final Widget body;

  const BasePage({super.key, required this.body});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Allocation Manager',
          style: TextStyle(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.primaryColor,
      ),
      drawer: const AppSidebar(),
      body: Expanded(child: widget.body),
    );
  }
}
