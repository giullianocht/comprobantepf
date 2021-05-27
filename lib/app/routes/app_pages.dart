import 'package:get/get.dart';

import 'package:comprobante/app/modules/home/bindings/home_binding.dart';
import 'package:comprobante/app/modules/home/views/home_view.dart';
import 'package:comprobante/app/modules/vista_previa/bindings/vista_previa_binding.dart';
import 'package:comprobante/app/modules/vista_previa/views/vista_previa_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.VISTA_PREVIA,
      page: () => VistaPreviaView(),
      binding: VistaPreviaBinding(),
    ),
  ];
}
