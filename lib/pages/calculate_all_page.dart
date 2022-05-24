import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nomina_docente/controller/all_docentes_controller.dart';

class CalculateAllPage extends StatefulWidget {
  const CalculateAllPage({Key? key}) : super(key: key);

  @override
  _CalculateAllPageState createState() => _CalculateAllPageState();
}

class _CalculateAllPageState extends State<CalculateAllPage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  final _formKey = GlobalKey<FormState>();

  final controller = Get.find<AllDocentesController>();
  
  @override
  Widget build(BuildContext context) {

    return Form(
      child: Column(
        children: [
          Expanded(
            child: Stepper(
              type: stepperType,
              physics: const ScrollPhysics(),
              currentStep: _currentStep,
              onStepTapped: (step) => tapped(step),
              onStepContinue: continued,
              onStepCancel: cancel,
              steps: <Step>[
                Step(
                  title: const Text('Numero de Docentes'),
                  content: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad de Docentes'),
                        controller: controller.nDocentes,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo Requerido';
                          } else if (int.parse(value) < 1) {
                            return 'Cantidad Erronea';
                          } else if (int.parse(value) > 9999) {
                            return 'Valor Exhorbitante';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: const Text('Tipos de Docente'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad de Auxiliar Tiempo Completo'),
                        controller: controller.nAuxTc,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo Requerido';
                          } else if (int.parse(value) < 0) {
                            return 'Cantidad Erronea';
                          } 
                          // else if (controller.validateQuantity(value)) {
                          //   return 'Sobrepasa la cantidad de docentes';
                          // }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad de Auxiliar Medio Tiempo'),
                        controller: controller.nAuxMt,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo Requerido';
                          } else if (int.parse(value) < 0) {
                            return 'Cantidad Erronea';
                          } 
                          // else if (controller.validateQuantity(value)) {
                          //   return 'Sobrepasa la cantidad de docentes';
                          // }
                          return null;
                        },                        
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad de Asistente Tiempo Completo'),
                        controller: controller.nAsisTc,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo Requerido';
                          } else if (int.parse(value) < 0) {
                            return 'Cantidad Erronea';
                          } 
                          // else if (controller.validateQuantity(value)) {
                          //   return 'Sobrepasa la cantidad de docentes';
                          // }
                          return null;
                        },                        
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad de Asistente Medio Tiempo'),
                        controller: controller.nAsisMt,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo Requerido';
                          } else if (int.parse(value) < 0) {
                            return 'Cantidad Erronea';
                          } 
                          // else if (controller.validateQuantity(value)) {
                          //   return 'Sobrepasa la cantidad de docentes';
                          // }
                          return null;
                        },                        
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad de Asociado Tiempo Completo'),
                        controller: controller.nAsoTc,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo Requerido';
                          } else if (int.parse(value) < 0) {
                            return 'Cantidad Erronea';
                          } 
                          // else if (controller.validateQuantity(value)) {
                          //   return 'Sobrepasa la cantidad de docentes';
                          // }
                          return null;
                        },                        
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad de Asociado Medio Tiempo'),
                        controller: controller.nAsoMt,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo Requerido';
                          } else if (int.parse(value) < 0) {
                            return 'Cantidad Erronea';
                          } 
                          // else if (controller.validateQuantity(value)) {
                          //   return 'Sobrepasa la cantidad de docentes';
                          // }
                          return null;
                        },                        
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad de Titular Tiempo Completo'),
                        controller: controller.nTituTc,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo Requerido';
                          } else if (int.parse(value) < 0) {
                            return 'Cantidad Erronea';
                          } 
                          // else if (controller.validateQuantity(value)) {
                          //   return 'Sobrepasa la cantidad de docentes';
                          // }
                          return null;
                        },                        
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad de Titular Medio Tiempo'),
                        controller: controller.nTituMt,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo Requerido';
                          } else if (int.parse(value) < 0) {
                            return 'Cantidad Erronea';
                          } 
                          // else if (controller.validateQuantity(value)) {
                          //   return 'Sobrepasa la cantidad de docentes';
                          // }
                          return null;
                        },                        
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: const Text('Cantidad de PostGrados Facturables'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText:
                                'Cantidad Docentes con Especializaciones'),
                        controller: controller.nEspecializacion,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo Requerido';
                          } else if (int.parse(value) < 1) {
                            return 'Cantidad Erronea';
                          } else if (int.parse(value) >
                              int.parse(controller.nDocentes.text)) {
                            return 'Sobrepasa la cantidad de docentes';
                          }
                          return null;
                        },                        
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad Docentes con Maestria'),
                        controller: controller.nMaestria,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad Docentes con Doctorado'),
                        controller: controller.nDoctorado,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad Docentes con PostDoctorado'),
                        controller: controller.nPostdoctorado,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: const Text('Semilleros'),
                  content: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad Docentes con semillero A1'),
                        controller: controller.nA1,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad Docentes con Semillero A'),
                        controller: controller.nA,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad Docentes con Semillero B'),
                        controller: controller.nB,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad Docentes con Semillero C'),
                        controller: controller.nC,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText:
                                'Cantidad Docentes con Semillero Reconocido por colciencias'),
                        controller: controller.nReconocido,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Cantidad Docentes con Semillero'),
                        controller: controller.nSemillero,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                      ),
                    ],
                  ),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 3
                      ? StepState.complete
                      : StepState.disabled,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 3 ? setState(() => _currentStep += 1) : calculate();
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  calculate() {
    showDialog(
        context: context,
        builder: (_) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(20),
            child: Card(
                child: Container(
                    width: Get.width * 0.9,
                    padding: const EdgeInsets.all(20),
                    child: ListView(children: <Widget>[
                      Center(
                          child: Column(
                        children: [
                          const Text(
                            'Salario Calculado Con base en: '
                            "S.M.M.L.V = 1'000.000",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "Cantidad Docentes: " + controller.nDocentes.text,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      )),
                      DataTable(
                        columns: const [
                          DataColumn(
                              label: Text('Tipo Docente',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Multiplicador',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('PostGrados',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Multiplicador',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Semilleros',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Multiplicador',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))),
                        ],
                        rows: [
                          DataRow(cells: [
                            const DataCell(Text('Auxiliar Tiempo Completo',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                            DataCell(
                                Text(controller.nAuxTc.text + "*2.645*smmlv")),
                            const DataCell(Text("ESPECIALIZACION")),
                            DataCell(Text(controller.nEspecializacion.text +
                                "*0.10*smmlv")),
                            const DataCell(Text("A1")),
                            DataCell(Text(controller.nA1.text + "*0.56*smmlv")),
                            const DataCell(Text("")),
                          ]),
                          DataRow(cells: [
                            const DataCell(Text('Auxiliar Medio Tiempo',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                            DataCell(
                                Text(controller.nAuxMt.text + "*1.509*smmlv")),
                            const DataCell(Text("MAESTRIA")),
                            DataCell(Text(
                                controller.nMaestria.text + "*0.45*smmlv")),
                            const DataCell(Text("A")),
                            DataCell(Text(controller.nA.text + "*0.47*smmlv")),
                            const DataCell(Text("")),
                          ]),
                          DataRow(cells: [
                            const DataCell(Text('Asistente Tiempo Completo',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                            DataCell(
                                Text(controller.nAsisTc.text + "*3.125*smmlv")),
                            const DataCell(Text("DOCTORADO")),
                            DataCell(Text(
                                controller.nDoctorado.text + "*0.90*smmlv")),
                            const DataCell(Text("B")),
                            DataCell(Text(controller.nB.text + "*0.42*smmlv")),
                            const DataCell(Text("")),
                          ]),
                          DataRow(cells: [
                            const DataCell(Text('Asistente Medio Tiempo',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                            DataCell(
                                Text(controller.nAsisMt.text + "*1.749*smmlv")),
                            const DataCell(Text("POSTDOCTORADO")),
                            DataCell(Text(
                                controller.nPostdoctorado.text + "*0.0*smmlv")),
                            const DataCell(Text("C")),
                            DataCell(Text(controller.nC.text + "*0.38*smmlv")),
                            const DataCell(Text("")),
                          ]),
                          DataRow(cells: [
                            const DataCell(Text('Asociado Tiempo Completo',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                            DataCell(
                                Text(controller.nAsoTc.text + "*3.606*smmlv")),
                            const DataCell(Text("")),
                            const DataCell(Text("")),
                            const DataCell(Text("RECONOCIDO POR COLCIENCIAS")),
                            DataCell(Text(
                                controller.nReconocido.text + "*0.33*smmlv")),
                            const DataCell(Text("")),
                          ]),
                          DataRow(cells: [
                            const DataCell(Text('Asociado Medio Tiempo',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                            DataCell(
                                Text(controller.nAsoMt.text + "*1.990*smmlv")),
                            const DataCell(Text("")),
                            const DataCell(Text("")),
                            const DataCell(Text("SEMILLERO")),
                            DataCell(Text(
                                controller.nSemillero.text + "*0.19*smmlv")),
                            const DataCell(Text("")),
                          ]),
                          DataRow(cells: [
                            const DataCell(Text('Titular Tiempo Completo',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                            DataCell(
                                Text(controller.nTituTc.text + "*3.918*smmlv")),
                            const DataCell(Text("")),
                            const DataCell(Text("")),
                            const DataCell(Text("")),
                            const DataCell(Text("")),
                            const DataCell(Text("")),
                          ]),
                          DataRow(cells: [
                            const DataCell(Text('Titular Medio Tiempo',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                            DataCell(
                                Text(controller.nTituMt.text + "*2.146*smmlv")),
                            const DataCell(Text("")),
                            const DataCell(Text("")),
                            const DataCell(Text("")),
                            const DataCell(Text("")),
                            const DataCell(Text("")),
                          ]),
                          DataRow(cells: [
                            const DataCell(Text('TOTAL: ',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                            DataCell(Text(
                                moneyFormat(controller.calculoparcialtype()))),
                            const DataCell(Text(" ")),
                            DataCell(Text(
                                moneyFormat(controller.calculoparcialPost()))),
                            const DataCell(Text(" ")),
                            DataCell(Text(moneyFormat(
                                controller.calculoparcialSemill()))),
                            DataCell(
                                Text(moneyFormat(controller.calculoTotal()))),
                          ]),
                        ],
                      ),
                    ]))),
          );
        });
  }
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
