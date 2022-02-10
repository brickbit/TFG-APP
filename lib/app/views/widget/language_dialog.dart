import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tfg_app/app/views/lang/localization_service.dart';

Future<String?> languageDialog() {
  return Get.defaultDialog(
    title: 'selectLanguage'.tr,
    content: SizedBox(
      height: 145,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Español'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Get.updateLocale(const Locale('es','ES'));
                Get.back();
              },
            ),
            Container(height: 1, width: 200, color: Colors.grey,),
            ListTile(
              title: const Text('English'),
              trailing: const Icon(Icons.chevron_right),
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
