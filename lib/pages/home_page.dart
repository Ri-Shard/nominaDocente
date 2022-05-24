// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomina_docente/controller/main_controller.dart';
import 'package:nomina_docente/models/docente.dart';
import 'package:nomina_docente/pages/dashboard_page.dart';
//import 'package:nomina_docente/widgets/app_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final mainController = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Docente showDocente;

    return Stack(
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade50,
                border: const Border(
                  bottom: BorderSide(color: Colors.black),
                  top: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                ),
              ),
              margin: const EdgeInsets.all(20),
              width: size.width * 0.5,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Center(
                    child: Text("LISTA DOCENTES UPC",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Expanded(child: _body(context, mainController)),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ChartPage()),
            )
          ],
        ),
      ],
    );
  }
}

Widget _body(BuildContext context, MainController controller) {
  return StreamBuilder<List<Docente>>(
      stream: controller.mostrarDocentes(),
      builder: (context, snapshot) {
        return snapshot.data == null
            ? const Center(
                child: Text("No hay Docentes"),
              )
            : ListView.builder(
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (BuildContext context, int i) {
                  return ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(20),
                              child: Card(
                                  child: Container(
                                      width: Get.width * 0.5,
                                      height: Get.height *0.6,
                                      padding: const EdgeInsets.all(20),
                                      child: ListView(children: <Widget>[
                                        Center(
                                            child: Column(
                                              children: const[
                                                Text(
                                          'Salario Calculado Con base en: ',
                                          style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Text("S.M.M.L.V = 1'000.000",
                                          style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                                  SizedBox(height: 30,)                                               
                                              ],
                                            )),
                                        DataTable(
                                          columns: const [
                                            DataColumn(
                                                label: Text('Variables',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            DataColumn(
                                                label: Text('Valores',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            DataColumn(
                                                label: Text('Multiplicador',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            DataColumn(
                                                label: Text('Total',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          ],
                                          rows:  [
                                            DataRow(cells: [
                                              DataCell(Text('Tipo Docente',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                              DataCell(Text(snapshot.data![i].type)),
                                              DataCell(Text(controller.valuemultiplicator(snapshot.data![i].type)+ "* S.M.M.L.V")),
                                              DataCell(Text(moneyFormat(controller.calculoparcialtype(snapshot.data![i].type)))),
                                            ]),
                                            DataRow(cells: [
                                              DataCell(Text('PostGrado mas Reciente',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                              DataCell(Text(controller.moreRecent(snapshot.data![i].postgrado))),
                                              DataCell(Text(controller.valuemultiplicator(controller.moreRecent(snapshot.data![i].postgrado))+ "* S.M.M.L.V")),
                                              DataCell(Text(moneyFormat(controller.calculoparcialPost(controller.moreRecent(snapshot.data![i].postgrado))))),
                                            ]),
                                            DataRow(cells: [
                                              DataCell(Text('Semillero Mas Nivel',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                              DataCell(Text(controller.moreLevel(snapshot.data![i].postgrado))),
                                              DataCell(Text(controller.valuemultiplicator(controller.moreLevel(snapshot.data![i].postgrado))+ "* S.M.M.L.V")),
                                              DataCell(Text(moneyFormat(controller.calculoparcialPost(controller.moreLevel(snapshot.data![i].postgrado))))),
                                            ]),
                                            DataRow(cells:  [
                                              DataCell(Text('TOTAL: ',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                              DataCell(Text(" ")),
                                              DataCell(Text(" ")),
                                              DataCell(Text(moneyFormat(controller.calcularSNomina(snapshot.data![i].postgrado, snapshot.data![i].type)), style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            ]),
                                          ],
                                        ),
                                      ]))),
                            );
                          });
                      controller.calcularSNomina(
                          snapshot.data![i].postgrado, snapshot.data![i].type);
                    },
                    leading: CircleAvatar(
                      child: Text(
                        "${i + 1}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    title: Text(snapshot.data![i].name),
                    subtitle: Text(snapshot.data![i].type),
                    trailing: Text(
                      "\$" " " + moneyFormat(snapshot.data![i].salary),
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                });
      });
}

String moneyFormat(String price) {
  if (price.length > 2) {
    var value = price;
    value = value.replaceAll(RegExp(r'\D'), '');
    value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    return value;
  }
  return "";
}
