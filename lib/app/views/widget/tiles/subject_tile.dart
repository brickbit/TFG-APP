import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/extension/color_extension.dart';
import 'package:tfg_app/data/model/subject_model.dart';

Widget subjectTile(bool mobile, List<SubjectModel> subjects, int index) {
  return Container(
    constraints: mobile
        ? const BoxConstraints(maxWidth: 250)
        : const BoxConstraints(maxWidth: 400),
    child: Row(
      children: [
        SizedBox(
          width: 6,
          height: 140,
          child: Container(
            color: subjects[index].color.parseColor(),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
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
            SizedBox(
                width: 230,
                child: Text(subjects[index].degree.name.toString())),
            const SizedBox(
              height: 4,
            ),
            Text(
              'departmentAcronym'.trParams({
                'acronym':
                    subjects[index].department.name!.toLowerCase().toString()
              }),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'classroomAcronym'.trParams(
                      {'acronym': subjects[index].classroom.name.toString()}),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'groupAcronym'.trParams(
                      {'acronym': subjects[index].classGroup.toString()}),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('subjectSemester'.trParams(
                    {'semester': (subjects[index].semester).toString()})),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'subjectLanguage'.trParams({
                    'language':
                        subjects[index].english == false ? 'Espa??ol' : 'English'
                  }),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'subjectLaboratory'.trParams({
                    'laboratory':
                        subjects[index].laboratory == false ? 'no'.tr : 'yes'.tr
                  }),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'subjectSeminar'.trParams({
                    'seminary':
                        subjects[index].seminary == false ? 'no'.tr : 'yes'.tr
                  }),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
