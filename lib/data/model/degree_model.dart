
class DegreeModel {
  final int? id;
  final String? name;
  final int? num_semesters;
  final String? year;

  DegreeModel({
    required this.id,
    required this.name,
    required this.num_semesters,
    required this.year
  });

  factory DegreeModel.fromJson(Map<String, dynamic> json) => DegreeModel(
    id: json["id"] as int?,
    name: json["name"] as String?,
    num_semesters: json["num_semesters"] as int?,
    year: json["year"] as String?,
  );

  static List<DegreeModel> listFromJson(list) =>
      List<DegreeModel>.from(list.map((x) => DegreeModel.fromJson(x)));

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "num_semesters": num_semesters,
    "year": year
  };
}

class Model {

}

