import 'dart:convert';

import 'package:tfg_app/data/model/classroom_model.dart';
import 'package:tfg_app/data/model/data_model.dart';
import 'package:tfg_app/data/model/degree_model.dart';
import 'package:tfg_app/data/model/department_model.dart';
import 'package:tfg_app/data/model/schedule_model.dart';
import 'package:tfg_app/data/model/subject_model.dart';
import 'package:tfg_app/domain/repository/data_repository.dart';
import 'package:get/get.dart';
import '../../domain/provider/classroom_provider.dart';
import '../../domain/provider/degree_provider.dart';
import '../../domain/provider/department_provider.dart';
import '../../domain/provider/schedule_provider.dart';
import '../../domain/provider/subject_provider.dart';

class DataRepositoryImpl implements DataRepository {
  DataRepositoryImpl({
    required this.degreeProvider,
    required this.classroomProvider,
    required this.departmentProvider,
    required this.subjectProvider,
    required this.scheduleProvider
  });

  final DegreeProvider degreeProvider;
  final ClassroomProvider classroomProvider;
  final DepartmentProvider departmentProvider;
  final SubjectProvider subjectProvider;
  final ScheduleProvider scheduleProvider;

  var degrees = Rx<List<DegreeModel>>([]);
  var classrooms = Rx<List<ClassroomModel>>([]);
  var departments = Rx<List<DepartmentModel>>([]);
  var subjects = Rx<List<SubjectModel>>([]);
  var schedules = Rx<List<ScheduleModel>>([]);

  @override
  Future<DataModel> getData() async {
    final degreeResponse = await degreeProvider
        .getDegrees("https://politech-manager.herokuapp.com/degree");
    if (degreeResponse.statusCode == 200) {
      degrees.value = DegreeModel.listFromJson(
          jsonDecode(utf8.decode(degreeResponse.bodyBytes)));
    } else {
      return Future.error(degreeResponse.statusCode);
    }

    final classroomResponse = await classroomProvider
        .getClassrooms("https://politech-manager.herokuapp.com/classroom");
    if (classroomResponse.statusCode == 200) {
      classrooms.value = ClassroomModel.listFromJson(
          jsonDecode(utf8.decode(classroomResponse.bodyBytes)));
    } else {
      return Future.error(classroomResponse.statusCode);
    }

    final departmentResponse = await departmentProvider
        .getDepartments("https://politech-manager.herokuapp.com/department");
    if (departmentResponse.statusCode == 200) {
      departments.value = DepartmentModel.listFromJson(
          jsonDecode(utf8.decode(departmentResponse.bodyBytes)));
    } else {
      return Future.error(departmentResponse.statusCode);
    }

    final subjectResponse = await subjectProvider
        .getSubjects("https://politech-manager.herokuapp.com/subject");
    if (subjectResponse.statusCode == 200) {
      subjects.value = SubjectModel.listFromJson(
          jsonDecode(utf8.decode(subjectResponse.bodyBytes)));
    } else {
      return Future.error(subjectResponse.statusCode);
    }

    final scheduleResponse = await scheduleProvider
        .getSchedules("https://politech-manager.herokuapp.com/schedule");
    if (scheduleResponse.statusCode == 200) {
      schedules.value = ScheduleModel.listFromJson(
          jsonDecode(utf8.decode(scheduleResponse.bodyBytes)));
    } else {
      return Future.error(scheduleResponse.statusCode);
    }

    return DataModel(
        degrees: degrees.value,
        classrooms: classrooms.value,
        departments: departments.value,
        subjects: subjects.value,
        schedules: schedules.value
    );
  }

  @override
  Future<DataModel> createDegree(DegreeModel degree) async {
    final response = await degreeProvider.createDegree("https://politech-manager.herokuapp.com/degree", degree);
    if (response.statusCode == 200) {
      await _getDegrees();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<DataModel> deleteDegree(int id) async {
    final response = await degreeProvider.deleteDegree(
        "https://politech-manager.herokuapp.com/degree/delete/$id");
    if (response.statusCode == 200) {
      await _getDegrees();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<DataModel> updateDegree(DegreeModel degree) async {
    final response = await degreeProvider.updateDegree("https://politech-manager.herokuapp.com/degree/update", degree);
    if (response.statusCode == 200) {
      await _getDegrees();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }


  Future<List<DegreeModel>> _getDegrees() async {
    final response = await degreeProvider
        .getDegrees("https://politech-manager.herokuapp.com/degree");
    if (response.statusCode == 200) {
      degrees.value =
          DegreeModel.listFromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return degrees.value;

    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<DataModel> updateClassroom(ClassroomModel classroom) async {
    final response = await classroomProvider.updateClassroom("https://politech-manager.herokuapp.com/classroom/update", classroom);
    if (response.statusCode == 200) {
      await _getClassrooms();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<DataModel> createClassroom(ClassroomModel classroom) async {
    final response = await classroomProvider.createClassroom("https://politech-manager.herokuapp.com/classroom", classroom);
    if (response.statusCode == 200) {
      await _getClassrooms();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<DataModel> deleteClassroom(int id) async {
    final response = await classroomProvider.deleteClassroom("https://politech-manager.herokuapp.com/classroom/delete/$id");
    if (response.statusCode == 200) {
      await _getClassrooms();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<List<ClassroomModel>> _getClassrooms() async {
    final response = await classroomProvider.getClassrooms("https://politech-manager.herokuapp.com/classroom");
    if (response.statusCode == 200) {
      classrooms.value = ClassroomModel.listFromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return classrooms.value;
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<DataModel> updateDepartment(DepartmentModel degree) async {
    final response = await departmentProvider.updateDepartment("https://politech-manager.herokuapp.com/department/update", degree);
    if (response.statusCode == 200) {
      await _getDepartments();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<DataModel> createDepartment(DepartmentModel degree) async {
    final response = await departmentProvider.createDepartment("https://politech-manager.herokuapp.com/department", degree);
    if (response.statusCode == 200) {
      await _getDepartments();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<DataModel> deleteDepartment(int id) async {
    final response = await departmentProvider.deleteDepartment("https://politech-manager.herokuapp.com/department/delete/$id");
    if (response.statusCode == 200) {
      await _getDepartments();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<List<DepartmentModel>> _getDepartments() async {
    final response = await departmentProvider.getDepartments("https://politech-manager.herokuapp.com/department");
    if (response.statusCode == 200) {
      departments.value = DepartmentModel.listFromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return departments.value;
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<DataModel> updateSubject(SubjectModel subject) async {
    final response = await subjectProvider.updateSubject("https://politech-manager.herokuapp.com/subject/update", subject);
    if (response.statusCode == 200) {
      await _getSubjects();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<DataModel> createSubject(SubjectModel subject) async {
    final response = await subjectProvider.createSubject("https://politech-manager.herokuapp.com/subject", subject);
    if (response.statusCode == 200) {
      await _getSubjects();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<DataModel> deleteSubject(int id) async {
    final response = await subjectProvider.deleteSubject("https://politech-manager.herokuapp.com/subject/delete/$id");
    if (response.statusCode == 200) {
      await _getSubjects();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<List<SubjectModel>> _getSubjects() async {
    final response = await subjectProvider.getSubjects("https://politech-manager.herokuapp.com/subject");
    if (response.statusCode == 200) {
      subjects.value = SubjectModel.listFromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return subjects.value;
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<DataModel> createSchedule(ScheduleModel schedule) async {
    final response = await scheduleProvider.createSchedule("https://politech-manager.herokuapp.com/schedule", schedule);
    if (response.statusCode == 200) {
      await _getSchedules();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<DataModel> deleteSchedule(int id) async {
    final response = await scheduleProvider.deleteSchedule("https://politech-manager.herokuapp.com/schedule/delete/$id");
    if (response.statusCode == 200) {
      await _getSchedules();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<DataModel> updateSchedule(ScheduleModel schedule) async {
    final response = await scheduleProvider.updateSchedule("https://politech-manager.herokuapp.com/schedule/update", schedule);
    if (response.statusCode == 200) {
      await _getSchedules();
      return DataModel(
          degrees: degrees.value,
          classrooms: classrooms.value,
          departments: departments.value,
          subjects: subjects.value,
          schedules: schedules.value
      );
    } else {
      return Future.error(response.statusCode);
    }
  }

  Future<List<ScheduleModel>> _getSchedules() async {
    final response = await scheduleProvider.getSchedules("https://politech-manager.herokuapp.com/schedules");
    if (response.statusCode == 200) {
      schedules.value = ScheduleModel.listFromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      return schedules.value;
    } else {
      return Future.error(response.statusCode);
    }
  }

}
