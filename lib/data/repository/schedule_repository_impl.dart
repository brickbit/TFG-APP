
import 'package:tfg_app/data/model/schedule_model.dart';
import 'package:tfg_app/domain/repository/schedule_repository.dart';
import '../../domain/provider/schedule_provider.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  ScheduleRepositoryImpl({required this.provider});

  final ScheduleProvider provider;

  @override
  Future<void> downloadSchedule(ScheduleModel schedule) async {
     var request = await provider.downloadSchedule("https://politech-manager.herokuapp.com/schedule/download", schedule);
     if (request != 200) {
       return Future.error(request);
     }
  }


}