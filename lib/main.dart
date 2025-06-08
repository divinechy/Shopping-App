import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/app/routes/pages.dart';
import 'package:shopping_app/root_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.landing,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'IBM Plex Sans',
      ),
      themeMode: ThemeMode.light,
      title: 'Shopping App',
      smartManagement: SmartManagement.onlyBuilder,
      getPages: Pages.routes,
      initialBinding: RootBindings(),
    ),
  );
}
