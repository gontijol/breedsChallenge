import 'package:breeds_challange/home/binding.dart';
import 'package:breeds_challange/home/page.dart';
import 'package:breeds_challange/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: const HomePage(),
    getPages: [
      ...AppRoutes.pages,
    ],
    debugShowCheckedModeBanner: false,
    initialBinding: HomeBindings(),
  ));
}
