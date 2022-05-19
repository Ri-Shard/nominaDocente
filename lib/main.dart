import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomina_docente/controller/main_controller.dart';
import 'package:nomina_docente/layouts/main_layout_page.dart';
import 'package:nomina_docente/pages/home_page.dart';
import 'package:nomina_docente/pages/register_page.dart';
import 'package:nomina_docente/services/navigator_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          Get.put(MainController());
          return GetMaterialApp(
              title: 'Nomina Docentes',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.green,
                
              ),
              initialRoute: '/',
              routes: {
                '/': (context) => const MyHomePage(),
                '/register': (context) =>  const RegisterPage(),
              },
              navigatorKey: navigationService.navigatorKey,
              builder: (_, child){
                return  MainLayout(
                  child: child ?? const CircularProgressIndicator(),
                );
              },
);
        });
  }
}


