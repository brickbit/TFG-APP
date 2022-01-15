import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/logger/Logger.dart';
import 'app/navigation/app_pages.dart';

void main() {
  runApp(const EpccApp());
}

class EpccApp extends StatelessWidget {
  const EpccApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: theme.copyWith(
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.black54,
            fontFamily: GoogleFonts.montserrat().fontFamily),
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: Colors.transparent,
            titleTextStyle: GoogleFonts.montserrat(
                fontSize: 18.0,
                color: Colors.black54
            ),
            actionsIconTheme: const IconThemeData(color: Colors.black54),
            iconTheme: const IconThemeData(color: Colors.black54),
            elevation: 0.0
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            foregroundColor: Colors.black
        ),
        colorScheme: theme.colorScheme.copyWith(
            primary: Colors.green,
            secondary: Colors.amber
        ),
      ),
    );
  }

}



