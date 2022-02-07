import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/views/lang/localization_service.dart';

Future<String?> languageDialog() {
  return Get.defaultDialog(
    title: 'selectLanguage'.tr,
    content: SizedBox(
      height: 155,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Español'),
              onTap: () {
                Get.updateLocale(const Locale('es','ES'));
                Get.back();
              },
            ),
            ListTile(
              title: const Text('English'),
              onTap: () {
                Get.updateLocale(const Locale('en','US'));
                Get.back();
              },
            ),
          ],
        ),
      ),
    ),
    actions: <Widget>[
    ],
  );
}
