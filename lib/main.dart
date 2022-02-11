import 'dart:io';
import 'dart:ui';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'app/logger/logger.dart';
import 'app/navigation/app_pages.dart';
import 'app/views/lang/localization_service.dart';
import 'app/views/themes/themes.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await DesktopWindow.setWindowSize(const Size(1400, 880));
    await DesktopWindow.setMinWindowSize(const Size(1400, 880));
    await DesktopWindow.setMaxWindowSize(Size.infinite);
  }

  runApp(const EpccApp());
}

class EpccApp extends StatelessWidget {
  const EpccApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: window.locale,
      debugShowCheckedModeBanner: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: AppThemes.light,
      translations: LocalizationService(),
    );
  }
}
