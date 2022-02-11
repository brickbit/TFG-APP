
import 'package:http/http.dart';

import '../../data/model/classroom_model.dart';

abstract class ClassroomProvider {
  Future<Response> getClassrooms(String path);
  Future<Response> updateClassroom(String path, ClassroomModel classroom);
  Future<Response> createClassroom(String path, ClassroomModel classroom);
  Future<Response> deleteClassroom(String path);
}