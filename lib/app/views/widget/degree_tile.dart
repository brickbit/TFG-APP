
import 'package:flutter/material.dart';
import 'package:tfg_app/data/model/degree_model.dart';

Widget degreeTile(bool mobile, List<DegreeModel> degrees, int index) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (mobile) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(degrees[index].name!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Num.semesters: ${degrees[index].num_semesters}',
              ),
              const SizedBox(
                height: 8,
              ),
              Text('A ${degrees[index].year}',
                  style: const TextStyle(fontSize: 12)),
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
                  degrees[index].name!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  ' - Num.semesters: ${degrees[index].num_semesters}',
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text('Year ${degrees[index].year}',
                style: const TextStyle(fontSize: 12)),
          ],
        );
      }
    },
  );
}