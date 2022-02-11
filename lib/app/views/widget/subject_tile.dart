
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tfg_app/app/extension/color_extension.dart';
import 'package:tfg_app/data/model/subject_model.dart';

Widget subjectTile(bool mobile, List<SubjectModel> subjects, int index) {
  return LayoutBuilder(
    builder: (context, constraints) {
      if (mobile) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Row(children: [
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
          ),],),
        );
      } else {
        return Container(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${subjects[index].name!} - ${subjects[index].acronym!}',
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.w500)),
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
      }
    },
  );
}