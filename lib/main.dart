import 'package:database_fire/transcation/view/transcation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'incomeexpense/view/home_screen.dart';
import 'incomeexpense/view/income_expense_screen.dart';

void main() {
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages:[
          GetPage(name: '/', page: () => Home_screen()),
          GetPage(name: '/incomescreen', page: () => incomescreen()),
          GetPage(name: '/Transaction', page: () => Transaction_screen()),
        ],
      ),
  );
}
