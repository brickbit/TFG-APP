

import 'package:flutter/material.dart';
import 'package:tfg_app/data/model/department_model.dart';

Widget departmentTile(bool mobile, List<DepartmentModel> departments, int index) {
  departments.sort((a, b) => a.name!.compareTo(b.name!));
  return LayoutBuilder(
    builder: (context, constraints) {
      if (mobile) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(departments[index].name!,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 4,
              ),
              Text(
                departments[index].acronym!,
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
                  departments[index].name!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  departments[index].acronym!,
                ),
              ],
            ),
          ],
        );
      }
    },
  );
}