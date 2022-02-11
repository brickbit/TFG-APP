import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tfg_app/app/controllers/home_controller.dart';
import 'package:tfg_app/app/views/widget/dialog/language_dialog.dart';

class SettingsView extends GetView<HomeController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var version = ''.obs;
    var buildNumber = ''.obs;
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      version.value = packageInfo.version;
      buildNumber.value = packageInfo.buildNumber;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('setting'.tr),
      ),
      body: SafeArea(
        child: Obx(
          () => ListView(
            children: [
              ListTile(
                title: Text('language'.tr),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey,),
                onTap: () async {
                  languageDialog().then((value) => {});
                },
              ),
              (Platform.isIOS || Platform.isAndroid) ?
                ListTile(
                  title: Text('darkTheme'.tr),
                  trailing: ObxValue(
                        (data) =>
                        Switch(
                          value: controller.isDarkMode.value,
                          activeColor: Colors.green,
                          onChanged: (val) {
                            controller.toggleDarkMode();
                          },
                        ),
                    false.obs,
                  ),
                  onTap: () {
                    if (Get.isDarkMode) {
                      Get.changeThemeMode(ThemeMode.light);
                    } else {
                      Get.changeThemeMode(ThemeMode.dark);
                    }
                  },
                ) : const SizedBox(height: 0, width: 0,),
              ListTile(
                title: Text('version'.tr),
                trailing: Text(version.value),
              ),
              ListTile(
                title: Text('compilationNumber'.tr),
                trailing: Text(buildNumber.value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
