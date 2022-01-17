
class ClassroomModel {
  final int? id;
  final String? name;
  final String? pavilion;
  final String? acronym;

  ClassroomModel({
    required this.id,
    required this.name,
    required this.pavilion,
    required this.acronym
  });

  factory ClassroomModel.fromJson(Map<String, dynamic> json) => ClassroomModel(
    id: json["id"] as int?,
    name: json["name"] as String?,
    pavilion: json["pavilion"] as String?,
    acronym: json["acronym"] as String?,
  );

  static List<ClassroomModel> listFromJson(list) =>
      List<ClassroomModel>.from(list.map((x) => ClassroomModel.fromJson(x)));

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "pavilion": pavilion,
    "acronym": acronym
  };
}
