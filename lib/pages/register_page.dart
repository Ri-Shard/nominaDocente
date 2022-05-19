// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:nomina_docente/controller/main_controller.dart';
import 'package:nomina_docente/models/complemento.dart';
import 'package:nomina_docente/models/docente.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mainController = Get.find<MainController>();

    final nameValidator = MultiValidator([
      RequiredValidator(errorText: 'El nombre es Requerido'),
      MinLengthValidator(2, errorText: 'Minimo 2 caracteres'),
      MaxLengthValidator(15, errorText: 'Maximo 15 caracteres'),
    ]);
    final ccValidator = MultiValidator([
      RequiredValidator(errorText: 'La cedula es Requerida'),
      MinLengthValidator(7, errorText: 'Minimo 7 digitos'),
      MaxLengthValidator(11, errorText: 'Maximo 11 digitos'),
    ]);
    final commontextfieldValidator = MultiValidator([
      RequiredValidator(errorText: ' Campo Requerido'),
    ]);

    List<Complemento> postGrados = [];
    final name = TextEditingController();
    final id = TextEditingController();
    TextEditingController date = TextEditingController();
    String tipoDocente = "Auxiliar Tiempo Completo";
    return Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 120,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              const Text(
                "Agregar Docente",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                  width: 500, child: makeInput("Nombre", name, nameValidator)),
              SizedBox(width: 500, child: makeInput("Cedula", id, ccValidator)),
              SizedBox(
                  width: 500,
                  child: DropdownButtonFormField(
                      value: tipoDocente,
                      hint: const Text("Tipo Docente"),
                      items: [
                        'Auxiliar Tiempo Completo',
                        'Auxiliar Medio Tiempo',
                        'Asistente Tiempo Completo',
                        'Asistente Medio Tiempo',
                        'Asociado Tiempo Completo',
                        'Asociado Medio Tiempo',
                        'Titular Tiempo Completo',
                        'Titular Medio Tiempo'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        tipoDocente = value.toString();
                      })),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        minWidth: double.infinity,
                        height: 60,
                        color: Colors.green,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                final postgrado = TextEditingController();
                                String level = "ESPECIALIZACION";

                                return Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(20),
                                  child: Card(
                                      child: Container(
                                    width: Get.width * 0.5,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text("Ingrese un postgrado"),
                                        makeInput("Titulo", postgrado,
                                            commontextfieldValidator),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        DropdownButtonFormField(
                                            value: level,
                                            hint: const Text("Cualificacion"),
                                            items: [
                                              'ESPECIALIZACION',
                                              'MAESTRIA',
                                              'DOCTORADO',
                                              'POST DOCTORADO',
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              level = value.toString();
                                            }),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        TextFormField(
                                          controller: date,
                                          decoration: const InputDecoration(
                                              icon: Icon(Icons.calendar_today),
                                              labelText:
                                                  "Fecha de Finalizacion del PostGrado"),
                                          readOnly: true,
                                          onTap: () async {
                                            DateTime? pickedDate =
                                                await showDatePicker(
                                                    context: _,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2000),
                                                    lastDate: DateTime.now());

                                            if (pickedDate != null) {
                                              String formattedDate =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickedDate);

                                              // setState(() {
                                              date.text = formattedDate;
                                              //});
                                            } else {}
                                          },
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 500,
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                top: 3, left: 3),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: const Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  top: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                  right: BorderSide(
                                                      color: Colors.black),
                                                )),
                                            child: MaterialButton(
                                              minWidth: double.infinity,
                                              height: 60,
                                              onPressed: () async {
                                                postGrados.add(Complemento(
                                                  nombre: postgrado.text,
                                                  level: level,
                                                  date: date.text,
                                                ));
                                                Get.back();
                                              },
                                              color: Colors.green,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: const Text(
                                                "Agregar",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                );
                              });
                        },
                        child: const Text(
                          "Agregar Posgrados",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  SizedBox(
                    width: 200,
                    child: Container(
                      padding: const EdgeInsets.only(top: 3, left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: const Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        minWidth: double.infinity,
                        height: 60,
                        color: Colors.green,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                final semillero = TextEditingController();
                                String level = "A1";
                                return Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.all(20),
                                  child: Card(
                                      child: Container(
                                    width: Get.width * 0.5,
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                            "Ingrese un semillero/grupo"),
                                        makeInput("Nombre", semillero,
                                            commontextfieldValidator),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        DropdownButtonFormField(
                                            value: level,
                                            hint: const Text("Clasificacion"),
                                            items: [
                                              'A1',
                                              'A',
                                              'B',
                                              'C',
                                              'RECONOCIDO POR COLCIENCIAS',
                                              'SEMILLERO'
                                            ].map<DropdownMenuItem<String>>(
                                                (String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              level = value.toString();
                                            }),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 500,
                                          child: Container(
                                            padding: const EdgeInsets.only(
                                                top: 3, left: 3),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: const Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black),
                                                  top: BorderSide(
                                                      color: Colors.black),
                                                  left: BorderSide(
                                                      color: Colors.black),
                                                  right: BorderSide(
                                                      color: Colors.black),
                                                )),
                                            child: MaterialButton(
                                              minWidth: double.infinity,
                                              height: 60,
                                              onPressed: () async {
                                                postGrados.add(Complemento(
                                                    nombre: semillero.text,
                                                    level: level,
                                                    date: "0000"));
                                                Get.back();
                                              },
                                              color: Colors.green,
                                              elevation: 0,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: const Text(
                                                "Agregar",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                                );
                              });
                        },
                        child: const Text(
                          "Agregar\nSemillero/Grupos",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Spacer(),
              SizedBox(
                width: 500,
                child: Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: const Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      )),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () async {
                      if (_formKey.currentState?.validate() == true) {
                        final docente = Docente(
                            id: id.text,
                            name: name.text,
                            type: tipoDocente,
                            postgrado: postGrados,
                            salary: mainController.calcularSNomina(
                                postGrados, tipoDocente));
                        mainController.guardarDocente(docente);
                        Get.back();
                      }
                    },
                    color: Colors.green,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      "Agregar",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

Widget buttn(String tet, Color color, String page, BuildContext context) {
  return ButtonTheme(
    height: 100,
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, page);
      },
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color)),
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

Widget makeInput(
    String t, TextEditingController controller, MultiValidator validator) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        t,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      const SizedBox(
        height: 5,
      ),
      TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        decoration: const InputDecoration(
          //contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
    ],
  );
}
