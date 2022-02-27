
import 'package:tfg_app/data/model/classroom_model.dart';
import 'package:tfg_app/data/model/degree_model.dart';
import 'package:tfg_app/data/model/department_model.dart';
import 'package:tfg_app/data/model/schedule_model.dart';
import 'package:tfg_app/data/model/subject_model.dart';

class DataModel{
  List<DegreeModel> degrees;
  List<ClassroomModel> classrooms;
  List<DepartmentModel> departments;
  List<SubjectModel> subjects;
  List<ScheduleModel> schedules;

  DataModel({
    required this.degrees,
    required this.classrooms,
    required this.departments,
    required this.subjects,
    required this.schedules
});
}