
import 'package:tfg_app/data/model/schedule_model.dart';

abstract class ScheduleRepository {
  Future<void> downloadSchedule(ScheduleModel schedule);
}