
import 'package:tfg_app/data/model/schedule_model.dart';

abstract class ScheduleRepository {
  Future<void> downloadSchedule(ScheduleModel schedule);
  Future<List<ScheduleModel>> createSchedule(ScheduleModel schedule);
  Future<List<ScheduleModel>> updateSchedule(ScheduleModel schedule);
  Future<List<ScheduleModel>> getSchedule();
  Future<List<ScheduleModel>> deleteSchedule(int id);

}