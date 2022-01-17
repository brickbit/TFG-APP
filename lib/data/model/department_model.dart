
class DepartmentModel {
  final int? id;
  final String? name;
  final String? acronym;

  DepartmentModel({
    required this.id,
    required this.name,
    required this.acronym
  });

  factory DepartmentModel.fromJson(Map<String, dynamic> json) => DepartmentModel(
    id: json["id"] as int?,
    name: json["name"] as String?,
    acronym: json["acronym"] as String?,
  );

  static List<DepartmentModel> listFromJson(list) =>
      List<DepartmentModel>.from(list.map((x) => DepartmentModel.fromJson(x)));

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "acronym": acronym
  };
}
