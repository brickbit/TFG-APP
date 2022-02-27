
import 'dart:convert';

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

  @override
  Future<List<ScheduleModel>> createSchedule(ScheduleModel schedule) async {
    final response = await provider.createSchedule("https://politech-manager.herokuapp.com/schedule", schedule);
    if (response.statusCode == 200) {
      return getSchedule();
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<ScheduleModel>> deleteSchedule(int id) async {
    final response = await provider.deleteSchedule("https://politech-manager.herokuapp.com/schedule/delete/$id");
    if (response.statusCode == 200) {
      return getSchedule();
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<ScheduleModel>> getSchedule() async {
    final response = await provider.getSchedules("https://politech-manager.herokuapp.com/schedule");
    if (response.statusCode == 200) {
      return ScheduleModel.listFromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      return Future.error(response.statusCode);
    }
  }

  @override
  Future<List<ScheduleModel>> updateSchedule(ScheduleModel schedule) async {
    final response = await provider.updateSchedule("https://politech-manager.herokuapp.com/schedule/update", schedule);
    if (response.statusCode == 200) {
      return getSchedule();
    } else {
      return Future.error(response.statusCode);
    }
  }


}