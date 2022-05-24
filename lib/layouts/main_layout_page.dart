import 'package:flutter/material.dart';
import 'package:nomina_docente/services/navigator_services.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buttn("INICIO", Colors.green, '/', context),
              const SizedBox(
                width: 15,
              ),
              buttn("AGREGAR", Colors.green, '/register', context),
              const SizedBox(
                width: 15,
              ),
              buttn("CALCULAR TODOS", Colors.green, '/all', context),
              const SizedBox(
                width: 15,
              ),
            ],
          )
        ],
        title: const Text("NOMINA DOCENTES UPC",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 3)),
      ),
      body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade50,
         
          ),
          child: child),
    );
  }

  Widget buttn(String tet, Color color, String page, BuildContext context) {
    return ButtonTheme(
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          navigationService.navigateTo( page);
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color)),
        child: Text(
          tet,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
