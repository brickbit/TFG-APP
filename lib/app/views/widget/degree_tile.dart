import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tfg_app/data/model/degree_model.dart';

Widget degreeTile(bool mobile, List<DegreeModel> degrees, int index) {
  return Container(
    constraints: mobile
        ? const BoxConstraints(maxWidth: 220)
        : const BoxConstraints(maxWidth: 650),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          degrees[index].name!,
          style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'degreeSemesters'
              .trParams({'semester': degrees[index].num_semesters.toString()}),
        ),
        const SizedBox(
          height: 8,
        ),
        Text('degreeYear'.trParams({'year': degrees[index].year.toString()}),
            style: const TextStyle(fontSize: 12)),
      ],
    ),
  );
}
