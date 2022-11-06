import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_class/src/modules/product/views/list_product_page.dart';
import 'package:modular_class/src/modules/product/views/product_page.dart';

class ProductModule extends Module{

  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => const ProductPage(), children: [
      ChildRoute('/red', child: (_, __) => Container(color: Colors.red,)),
      ChildRoute('/blue', child: (_, __) => Container(color: Colors.blue,)),
      ChildRoute('/yellow', child: (_, __) => Container(color: Colors.yellow,)),
    ]),
    ChildRoute('/list/:id',
        child: (_, args) => ListProductPage(
          //id: args.params['id'] ?? '',
          id: args.data ?? '',),
      transition: TransitionType.fadeIn,
      duration: const Duration(seconds: 1)
    ),
  ];
}