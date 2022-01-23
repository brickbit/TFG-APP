

import 'package:flutter/material.dart';
import 'package:tfg_app/app/views/widget/subject_box.dart';

import 'draggable_subject_box.dart';

Widget dragListSubject(List<SubjectBox> subjectBoxes) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        height: 65,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          height: 50.0,
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: subjectBoxes.length,
            itemBuilder: (context, index) {
              return SizedBox(
                  width: 70,
                  height: 50,
                  child: draggableSubjectBox(subjectBoxes[index]));
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 16,
              );
            },
          ),
        ),
      ),
    ]),
  );
}