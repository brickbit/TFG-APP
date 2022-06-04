
import 'dart:convert';
import 'dart:io';
import 'package:file_saver/file_saver.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:tfg_app/data/model/schedule_model.dart';
import '../../domain/provider/schedule_provider.dart';
import 'package:http/http.dart';


class ScheduleProviderImpl implements ScheduleProvider {
  @override
  Future<int> downloadSchedule(String path, ScheduleModel schedule) async {
    var request = http.Request('GET', Uri.parse(path));
    var headers = {
      'Content-Type': 'application/json'
    };

    request.body = json.encode(schedule);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      http.ByteStream stream = response.stream;
      var bytes = await stream.toBytes();
      MimeType type = MimeType.MICROSOFTEXCEL;
      if (Platform.isAndroid || Platform. isIOS) {
        String path = await FileSaver.instance.saveAs(
            "schedule",
            bytes,
            "xlsx",
            type);
      } else  if (Platform.isMacOS){
        final path = await _localPath;
        File f = File('$path/schedule.xlsx');
        await f.writeAsBytes(bytes);
      }
      return Future.value(response.statusCode);
    }
    else {
      return Future.error(response.statusCode);
    }
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  @override
  Future<http.Response> createSchedule(String path, ScheduleModel schedule) {
    var body = schedule.toJson();

    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
  }

  @override
  Future<http.Response> deleteSchedule(String path) {
    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
    );
  }

  @override
  Future<http.Response> getSchedules(String path) {
    return get(Uri.parse(path));
  }

  @override
  Future<http.Response> updateSchedule(String path, ScheduleModel schedule) {
    var body = schedule.toJson();

    return post(
      Uri.parse(path),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
  }

}