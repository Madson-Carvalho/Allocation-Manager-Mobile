class Project {
  final String projectId;
  final String name;
  final int projectHours;
  final String projectCoordinator;
  final String fundingSource;
  final double totalProjectValue;
  final DateTime initialDate;
  final DateTime deliveryDate;

  Project({
    required this.projectId,
    required this.name,
    required this.projectHours,
    required this.projectCoordinator,
    required this.fundingSource,
    required this.totalProjectValue,
    required this.initialDate,
    required this.deliveryDate,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      projectId: json['projectId'],
      name: json['name'],
      projectHours: json['projectHours'],
      projectCoordinator: json['projectCoordinator'],
      fundingSource: json['fundingSource'],
      totalProjectValue: json['totalProjectValue'],
      initialDate: DateTime.parse(json['initialDate']),
      deliveryDate: DateTime.parse(json['deliveryDate']),
    );
  }
}