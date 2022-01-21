
import 'package:flutter/material.dart';
import 'package:tfg_app/data/model/classroom_model.dart';

Widget classroomTile(bool mobile, List<ClassroomModel> classrooms, int index) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (mobile) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${classrooms[index].name!} - ${classrooms[index].acronym!}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Pavilion: ${classrooms[index].pavilion}',
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${classrooms[index].name!} - ${classrooms[index].acronym!}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Pavilion: ${classrooms[index].pavilion}',
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        );
      }
    },
  );
}