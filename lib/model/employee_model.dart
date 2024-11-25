class Employee {
  final String employeeId;
  final String name;
  final String email;
  final int workInSeconds;
  final String jobRole;
  final double wage;
  final String qualification;
  final String specializations;

  Employee({
    required this.employeeId,
    required this.name,
    required this.email,
    required this.workInSeconds,
    required this.jobRole,
    required this.wage,
    required this.qualification,
    required this.specializations,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      employeeId: json['employeeId'],
      name: json['name'],
      email: json['email'],
      workInSeconds: json['workInSeconds'],
      jobRole: json['jobRole'],
      wage: json['wage'],
      qualification: json['qualification'],
      specializations: json['specializations'],
    );
  }
}