import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:comprobante/app/theme/theme_data.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Comprobante PF",
      initialRoute: AppPages.INITIAL,
      theme: appThemeData,
      getPages: AppPages.routes,
    ),
  );
}
