
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:tfg_app/app/views/widget/subject_box.dart';

Draggable<SubjectBox> draggableSubjectBox(SubjectBox subject) {
  return Draggable<SubjectBox>(
    data: subject,
    child: subject,
    feedback: subject,
    onDragCompleted: () {
      developer.log('${subject.time}');
      subject.time -= 30;
    },
  );
}