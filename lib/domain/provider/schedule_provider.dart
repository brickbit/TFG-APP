
import 'package:tfg_app/data/model/schedule_model.dart';
import 'package:http/http.dart';

abstract class ScheduleProvider {
  Future<int> downloadSchedule(String path, ScheduleModel schedule);
  Future<Response> getSchedules(String path);
  Future<Response> updateSchedule(String path, ScheduleModel schedule);
  Future<Response> createSchedule(String path, ScheduleModel schedule);
  Future<Response> deleteSchedule(String path);
}