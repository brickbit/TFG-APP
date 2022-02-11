
import 'package:tfg_app/data/model/schedule_model.dart';

abstract class ScheduleProvider {
  Future<int> downloadSchedule(String path, ScheduleModel schedule);
}