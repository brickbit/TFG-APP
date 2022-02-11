
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tfg_app/data/model/classroom_model.dart';

Widget classroomTile(bool mobile, List<ClassroomModel> classrooms, int index) {
  classrooms.sort((a, b) => a.name!.compareTo(b.name!));
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
                'classroomPavilion'.trParams({'pavilion': classrooms[index].pavilion!.toLowerCase().toString()}),
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
            Text('${classrooms[index].name!} - ${classrooms[index].acronym!}',
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w500)),
            const SizedBox(
              height: 4,
            ),
            Text(
              'classroomPavilion'.trParams({'pavilion': classrooms[index].pavilion!.toLowerCase().toString()}),
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