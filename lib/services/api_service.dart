import 'dart:convert';
import 'package:allocation_manager_mobile/model/employee_model.dart';
import 'package:allocation_manager_mobile/model/project_model.dart';
import 'package:http/http.dart' as http;


class ApiService {
  final baseUrl = 'http://localhost:8080/api/v1/';

  Future<List<Employee>> fetchEmployees() async {
    try {
      final url = Uri.parse("${baseUrl}employees/find-all");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Employee.fromJson(json)).toList();
      } else {
        throw Exception('Erro na requisição: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Ocorreu um erro: $e');
    }
  }

  Future<List<Project>> fetchProjects() async {
    try {
      final url = Uri.parse("${baseUrl}projects/find-all");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => Project.fromJson(json)).toList();
      } else {
        throw Exception('Erro na requisição: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Ocorreu um erro: $e');
    }
  }
}


