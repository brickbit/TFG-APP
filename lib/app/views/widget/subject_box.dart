import 'package:flutter/material.dart';

class SubjectBox extends StatelessWidget {
  final MaterialColor color;
  final String name;
  int time;

  SubjectBox({
    Key? key,
    required this.color,
    required this.name,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 60,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 12, color: Colors.black),
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
                  time.toString(),
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
