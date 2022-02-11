
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tfg_app/data/model/degree_model.dart';

Widget degreeTile(bool mobile, List<DegreeModel> degrees, int index) {
  degrees.sort((a, b) => a.name!.compareTo(b.name!));
  return LayoutBuilder(
    builder: (context, constraints) {
      if (mobile) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 220),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(degrees[index].name!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 4,
              ),
              Text(
                'degreeSemesters'.trParams({'semester': degrees[index].num_semesters.toString()}),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('degreeYear'.trParams({'year': degrees[index].year.toString()}),
                  style: const TextStyle(fontSize: 12)),
            ],
          ),
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(degrees[index].name!, style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),),
            const SizedBox(
              height: 4,
            ),
            Text(
              'degreeSemesters'.trParams({'semester': degrees[index].num_semesters.toString()}),
            ),
            const SizedBox(
              height: 8,
            ),
            Text('degreeYear'.trParams({'year': degrees[index].year.toString()}),
                style: const TextStyle(fontSize: 12)),
          ],
        );
      }
    },
  );
}