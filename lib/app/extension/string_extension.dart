
import 'package:get/get.dart';

extension ClassroomString on String {
  String toClassroom() {
    if (this == 'central'.tr) {
      return 'CENTRAL';
    } else if (this == 'computing'.tr) {
      return 'COMPUTING';
    } else if (this == 'architecture'.tr) {
      return 'ARCHITECTURE';
    } else if (this == 'telecommunication'.tr) {
      return 'TELECOMMUNICATION';
    } else if (this == 'civil_work'.tr) {
      return 'CIVIL_WORK';
    } else {
      return 'CENTRAL';
    }
  }
}
