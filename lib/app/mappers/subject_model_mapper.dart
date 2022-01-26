
import 'package:tfg_app/app/views/widget/subject_box.dart';
import 'package:tfg_app/data/model/subject_model.dart';

extension SubjectModelMapper on SubjectModel {
  SubjectBox toSubjectBox() {
    return SubjectBox(subject: this);
  }
}