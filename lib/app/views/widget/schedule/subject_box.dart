import 'package:flutter/material.dart';
import 'package:tfg_app/app/extension/color_extension.dart';
import 'package:tfg_app/data/model/subject_model.dart';

class SubjectBox extends StatelessWidget {
  final SubjectModel subject;

  const SubjectBox({
    Key? key,
    required this.subject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 60,
      decoration: BoxDecoration(
          color: subject.color.parseColor(),
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(width: 4,),
                subject.seminary == true
                    ? const Icon(Icons.emoji_people_sharp, color: Colors.black45,size: 16)
                    : const SizedBox(
                  width: 0,
                  height: 0,
                ),
                subject.laboratory == true
                    ? const Icon(Icons.science_sharp, color: Colors.black45,size: 16,)
                    : const SizedBox(
                  width: 0,
                  height: 0,
                ),
                subject.english == true
                    ? const Icon(Icons.flag, color: Colors.black45,size: 16,)
                    : const SizedBox(
                  width: 0,
                  height: 0,
                ),
                Text(
                  subject.acronym ?? '',
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.alarm,
                  size: 16,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  subject.time.toString(),
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
