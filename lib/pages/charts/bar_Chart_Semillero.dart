// ignore_for_file: file_names

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomina_docente/controller/main_controller.dart';

class BarChartSemilleroPage extends StatefulWidget {
  const BarChartSemilleroPage({Key? key}) : super(key: key);


  @override
  State<BarChartSemilleroPage> createState() => _BarChartSemilleroPageState();
}

class _BarChartSemilleroPageState extends State<BarChartSemilleroPage> {
  
  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();
 return FutureBuilder(
   future: mainController.semilleros(),
   builder: (context, AsyncSnapshot<List<double>> snapshot) {
     return snapshot.data == null ? const Center(child:  Text("No hay")) : BarChart(
          BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: double.parse(mainController.totalList(snapshot.data!).toString()),
              minY: 0,
              titlesData: FlTitlesData(
                bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (val) => const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                    margin: 20,
                    getTitles: (double value) {
                      switch (value.toInt()) {
                        case 0:
                          return 'A1';
                        case 1:
                          return 'A';
                        case 2:
                          return 'B';
                        case 3:
                          return 'C';
                        case 4:
                          return 'R P C';
                        case 5:
                          return 'Semillero';
                        default:
                          return '';
                      }
                    }),
              ),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(y: snapshot.data![0],colors: [
                      const Color(0xff0293ee),
                      const Color(0xff0293ee),
                    ]),
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(y: snapshot.data![1], colors: [
                      const Color(0xfff8b250),
                      const Color(0xfff8b250),
                    ]),
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(y: snapshot.data![2], colors: [
                      const Color(0xff845bef),
                      const Color(0xff845bef),
                    ]),
                  ],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(y: snapshot.data![3], colors: [
                      const Color(0xff13d38e),
                      const Color(0xff13d38e),
                    ]),
                  ],
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: [
                    BarChartRodData(y: snapshot.data![4], colors: [
                      const Color(0xff13d38e),
                      const Color(0xff13d38e),
                    ]),
                  ],
                ),
                BarChartGroupData(
                  x: 5,
                  barRods: [
                    BarChartRodData(y: snapshot.data![5], colors: [
                      const Color(0xff13d38e),
                      const Color(0xff13d38e),
                    ]),
                  ],
                ),
              ]),
        );
   }
 );
  }
}