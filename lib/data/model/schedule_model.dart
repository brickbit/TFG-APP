
import 'package:tfg_app/data/model/subject_model.dart';

class ScheduleModel {
  final List<List<List<SubjectModel?>>> subjects;
  final int scheduleType;
  final int fileType;
  final String degree;
  final String year;

  ScheduleModel({
    required this.subjects,
    required this.scheduleType,
    required this.fileType,
    required this.degree,
    required this.year,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
    subjects: json["subjects"] as List<List<List<SubjectModel?>>>,
    scheduleType: json["scheduleType"] as int,
    fileType: json["fileType"] as int,
    degree: json["degree"] as String,
    year: json["year"] as String,
  );

  static List<ScheduleModel> listFromJson(list) =>
      List<ScheduleModel>.from(list.map((x) => ScheduleModel.fromJson(x)));

  Map<String, dynamic> toJson() => {
    "subjects": subjects,
    "scheduleType": scheduleType,
    "fileType": fileType,
    "degree": degree,
    "year": year,
  };

}
