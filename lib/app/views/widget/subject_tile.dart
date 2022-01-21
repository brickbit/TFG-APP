
import 'package:flutter/material.dart';
import 'package:tfg_app/data/model/subject_model.dart';

Widget subjectTile(bool mobile, List<SubjectModel> subjects, int index) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (mobile) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${subjects[index].name!} - ${subjects[index].acronym!}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 4,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                  subjects[index].degree.name.toString()
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Department: ${subjects[index].department.acronym}',
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Classroom: ${subjects[index].classroom.acronym}',
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Semester: ${subjects[index].semester + 1}',
                  ),
                  Text(
                      'Language: ${subjects[index].english==false ? 'Español':'English'}'
                  ),
                ],),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Laboratorio: ${subjects[index].laboratory==false ? 'No':'Yes'}'
                  ),
                  Text(
                      'Seminario: ${subjects[index].seminary==false ? 'No':'Yes'}'
                  ),

                ],),

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
                  '${subjects[index].name!} - ${subjects[index].acronym!}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Semester: ${subjects[index].semester}',
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