
import 'package:tfg_app/data/model/schedule_model.dart';
import 'package:tfg_app/domain/schedule_repository.dart';

import '../schedule_provider.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  ScheduleRepositoryImpl({required this.provider});

  final ScheduleProvider provider;

  @override
  Future<void> downloadSchedule(ScheduleModel schedule) async {
    provider.downloadSchedule("https://politech-manager.herokuapp.com/schedule/download", schedule);
  }


}