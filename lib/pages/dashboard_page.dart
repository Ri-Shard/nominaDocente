import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nomina_docente/controller/main_controller.dart';
import 'package:nomina_docente/pages/charts/bar_chart_Tipo.dart';

import 'charts/bar_Chart_PostGrado.dart';
import 'charts/bar_Chart_Semillero.dart';

class ChartPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChartPage({Key? key}) : super(key: key);

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final mainController = Get.find<MainController>();
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Center(
      child: CarouselSlider(
        items: [
          Column(
            children: const [
              Text(
                "Grafico Docentes por Postgrados",
                style: TextStyle(fontSize: 20),
              ),
              BarChartPostGradoPage()
            ],
          ),
          Column(
            children: const [
              Text(
                "Grafico Docentes por Semillero",
                style: TextStyle(fontSize: 20),
              ),
              BarChartSemilleroPage()
            ],
          ),
          Column(
            children: const [
              Text(
                "Grafico Docentes por Tipo",
                style: TextStyle(fontSize: 20),
              ),
              BarChartTipoPage()
            ],
          ),
        ],
        options: CarouselOptions(
          height: height,
          autoPlay: true,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(seconds: 5),
        ),
      ),
    );
  }
}
