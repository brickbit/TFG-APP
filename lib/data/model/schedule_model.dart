
import 'package:tfg_app/data/model/subject_model.dart';

class ScheduleModel {
  final int? id;
  final List<List<List<SubjectModel?>>> subjects;
  final int scheduleType;
  final int fileType;
  final String degree;
  final String year;

  ScheduleModel({
    required this.id,
    required this.subjects,
    required this.scheduleType,
    required this.fileType,
    required this.degree,
    required this.year,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
    id: json["id"] as int,
    subjects: listDynamicTo3DMatrixSubject(json["subjects"]),  //json["subjects"] as List<List<List<SubjectModel?>>>,
    scheduleType: json["scheduleType"] as int,
    fileType: json["fileType"] as int,
    degree: json["degree"] as String,
    year: json["year"] as String,
  );

  static List<ScheduleModel> listFromJson(list) =>
      List<ScheduleModel>.from(list.map((x) => ScheduleModel.fromJson(x)));

  static List<List<List<SubjectModel?>>> listDynamicTo3DMatrixSubject(List<dynamic> list) {
    return list.map((x) => listDynamicTo2DMatrixSubject(x)).toList();
  }

  static List<List<SubjectModel?>> listDynamicTo2DMatrixSubject(List<dynamic> list) {
    return list.map((x) {
      return listDynamicToListSubject(x);
    }).toList();
  }

  static List<SubjectModel?> listDynamicToListSubject(List<dynamic> list) {
    return list.map((x) {
      if(x != null) {
        return SubjectModel.fromJson(x as Map<String, dynamic>);
      } else {
        return null;
      }
    }).toList();
  }


    Map<String, dynamic> toJson() => {
    "subjects": subjects,
    "scheduleType": scheduleType,
    "fileType": fileType,
    "degree": degree,
    "year": year,
  };

}
