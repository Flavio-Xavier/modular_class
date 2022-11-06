import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_class/src/modules/auth/auth_module.dart';
import 'package:modular_class/src/modules/auth/guards/auth_guards.dart';
import 'package:modular_class/src/modules/product/product_module.dart';
import 'package:modular_class/src/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModule extends Module{

  @override
  List<Bind<Object>> get binds => [
    AsyncBind((i) => SharedPreferences.getInstance())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const SplashPage()),
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/product', module: ProductModule(), guards: [AuthGuard()]),
  ];
}