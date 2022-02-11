
import 'dart:convert';
import 'dart:io';
import 'package:file_saver/file_saver.dart';
import 'package:http/http.dart' as http;
import 'package:tfg_app/data/model/schedule_model.dart';
import '../../domain/provider/schedule_provider.dart';

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
      if (Platform.isIOS || Platform.isAndroid) {
        String path = await FileSaver.instance.saveAs(
            "schedule",
            bytes,
            "xlsx",
            type);
        print(path);
      }
      return Future.value(response.statusCode);
    }
    else {
      return Future.error(response.statusCode);
    }

  }

}