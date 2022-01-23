import 'package:tfg_app/data/model/degree_model.dart';

class ScheduleFeaturesModel {
  final String scheduleType;
  final int semester;
  final DegreeModel degree;

  ScheduleFeaturesModel({
    required this.scheduleType,
    required this.semester,
    required this.degree
});
}