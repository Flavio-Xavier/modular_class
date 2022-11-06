
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_class/src/app_module.dart';
import 'package:modular_class/src/app_widget.dart';

void main(){
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}