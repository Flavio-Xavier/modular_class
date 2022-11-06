import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_class/src/app_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Modular.isModuleReady<AppModule>(),
      builder: (_, snapshot){
      if (snapshot.connectionState == ConnectionState.waiting) {
        return MaterialApp(
          home: Container(),
        );
      }
      return const MaterialApp().modular();
    });
  }
}
