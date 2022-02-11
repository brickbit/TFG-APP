import 'package:tfg_app/data/model/degree_model.dart';
import 'classroom_model.dart';
import 'degree_model.dart';
import 'department_model.dart';

class SubjectModel {
  final int? id;
  final String? name;
  final String? acronym;
  final String classGroup;
  final bool seminary;
  final bool laboratory;
  final bool english;
  final int time;
  final int semester;
  final String days;
  final String hours;
  final String turns;
  final ClassroomModel classroom;
  final DepartmentModel department;
  final DegreeModel degree;
  final int color;

  SubjectModel({
    required this.id,
    required this.name,
    required this.acronym,
    required this.classGroup,
    required this.seminary,
    required this.laboratory,
    required this.english,
    required this.time,
    required this.semester,
    required this.days,
    required this.hours,
    required this.turns,
    required this.classroom,
    required this.department,
    required this.degree,
    required this.color,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        id: json["id"] as int?,
        name: json["name"] as String?,
        acronym: json["acronym"] as String?,
        classGroup: json["classGroup"] as String,
        seminary: json["seminary"] as bool,
        laboratory: json["laboratory"] as bool,
        english: json["english"] as bool,
        time: json["time"] as int,
        semester: json["semester"] as int,
        days: json["days"] as String,
        hours: json["hours"] as String,
        turns: json["turns"] as String,
        classroom:
            ClassroomModel.fromJson(json["classroom"] as Map<String, dynamic>),
        department: DepartmentModel.fromJson(
            json["department"] as Map<String, dynamic>),
        degree: DegreeModel.fromJson(json["degree"] as Map<String, dynamic>),
        color: json["color"] as int,
      );

  static List<SubjectModel> listFromJson(list) =>
      List<SubjectModel>.from(list.map((x) => SubjectModel.fromJson(x)));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "acronym": acronym,
        "classGroup": classGroup,
        "seminary": seminary,
        "laboratory": laboratory,
        "english": english,
        "time": time,
        "semester": semester,
        "days": days,
        "hours": hours,
        "turns": turns,
        "classroom": classroom,
        "department": department,
        "degree": degree,
        "color": color,
      };

  SubjectModel copyWith({
    required int newTime,
  }) =>
      SubjectModel(
          id: id,
          name: name,
          acronym: acronym,
          classGroup: classGroup,
          seminary: seminary,
          laboratory: laboratory,
          english: english,
          time: newTime,
          semester: semester,
          days: days,
          hours: hours,
          turns: turns,
          classroom: classroom,
          department: department,
          degree: degree,
          color: color);

  SubjectModel deleteItem({
    required int newTime,
  }) =>
      SubjectModel(
          id: id,
          name: name,
          acronym: acronym,
          classGroup: classGroup,
          seminary: seminary,
          laboratory: laboratory,
          english: english,
          time: newTime,
          semester: semester,
          days: "",
          hours: "",
          turns: "",
          classroom: classroom,
          department: department,
          degree: degree,
          color: color);

  SubjectModel selectItem({
    required int newDay, required int newHour
  }) =>
      SubjectModel(
          id: id,
          name: name,
          acronym: acronym,
          classGroup: classGroup,
          seminary: seminary,
          laboratory: laboratory,
          english: english,
          time: time,
          semester: semester,
          days: days.isEmpty ? '$newDay' : '$days,$newDay',
          hours: hours.isEmpty ? '$newHour' : '$hours,$newHour',
          turns: "",
          classroom: classroom,
          department: department,
          degree: degree,
          color: color);
}
