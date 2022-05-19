// ignore_for_file: unnecessary_overrides, avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nomina_docente/models/complemento.dart';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:html' as html;
import 'package:nomina_docente/models/docente.dart';

class MainController extends GetxController {
//  final _storage = html.window.localStorage;
List<Docente> postgradoslistAux=[];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  guardarDocente(Docente docente) {
    FirebaseFirestore.instance
        .collection("Docente")
        .doc("docentes")
        .set({docente.id: docente.toJSONEncodable()}, SetOptions(merge: true));
  }

  Stream<List<Docente>> mostrarDocentes() {
    return FirebaseFirestore.instance
        .collection("Docente")
        .doc("docentes")
        .get()
        .asStream()
        .map((event) {
      List<Docente> docenteAux = [];
      for (var item in event.data()!.values) {
        List<Complemento> complementosAux = [];
        for (var comple in item["postgrado"]) {
          complementosAux.add(Complemento(
              nombre: comple["nombre"],
              level: comple["level"],
              date: comple["date"]));
        }
        docenteAux.add(Docente(
            name: item["name"],
            id: item["id"],
            type: item["type"],
            salary: item["salary"],
            postgrado: complementosAux));
      }
      postgradoslistAux=docenteAux;
      return docenteAux;
    });
  }

  String calcularSNomina(List<Complemento> postgrado, String type) {
    double post = 0.0;
    double semill = 0.0;
    double base = 0.0;
    double fin = 0.0;
    double smmlv = 1000000.0;
    double mostRecent = 9999;
    Complemento mostRecentComp =
        Complemento(date: "0000", nombre: "nombre", level: "ESPECIALIZACION");
    Complemento moreLevelSemill =
        Complemento(date: "0000", nombre: "nombre", level: "SEMILLERO");
    postgrado.forEach((element) {
      if (element.level == "POSTDOCTORADO") {
        mostRecentComp = element;
      } else if (element.level == "DOCTORADO" &&
          mostRecentComp.level != "POSTDOCTORADO") {
        mostRecentComp = element;
      } else if (element.level == "MAESTRIA" &&
          mostRecentComp.level != "DOCTORADO" &&
          mostRecentComp.level != "POSTDOCTORADO") {
        mostRecentComp = element;
      } else if (element.level == "ESPECIALIZACION" &&
          mostRecentComp.level != "DOCTORADO" &&
          mostRecentComp.level != "POSTDOCTORADO" &&
          mostRecentComp.level != "MAESTRIA") {
        mostRecentComp = element;
      }
      if (element.level == "A1") {
        moreLevelSemill = element;
      } else if (element.level == "A" &&
          moreLevelSemill.level != "A1") {
        moreLevelSemill = element;
      } else if (element.level == "B" &&
          moreLevelSemill.level != "A" &&
          moreLevelSemill.level != "A1") {
        moreLevelSemill = element;
      } else if (element.level == "C" &&
          moreLevelSemill.level != "B" &&
          moreLevelSemill.level != "A" &&
          moreLevelSemill.level != "A1") {
        moreLevelSemill = element;
      }else if (element.level == "RECONOCIDO POR COLCIENCIAS" &&
          moreLevelSemill.level != "C" &&
          moreLevelSemill.level != "B" &&
          moreLevelSemill.level != "A" &&
          moreLevelSemill.level != "A1") {
        moreLevelSemill = element;
      }else if (element.level == "SEMILLERO" &&
          moreLevelSemill.level != "RECONOCIDO POR COLCIENCIAS" &&
          moreLevelSemill.level != "C" &&
          moreLevelSemill.level != "B" &&
          moreLevelSemill.level != "A" &&
          moreLevelSemill.level != "A1") {
        moreLevelSemill = element;
      }




      if (element.date != "0000") {
        DateTime date = DateTime.parse(element.date);
        String formatedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
        DateTime nowformated = DateTime.parse(formatedDate);
        Duration dias = nowformated.difference(date);
        if (double.parse(dias.inDays.toString()) < mostRecent) {
          mostRecent = double.parse(dias.inDays.toString());
        }
      }

    });
      if (moreLevelSemill.level == "A1") {
        semill = semill + smmlv * 0.56;
      }
      if (moreLevelSemill.level == "A") {
        semill = semill + smmlv * 0.47;
      }
      if (moreLevelSemill.level == "B") {
        semill = semill + smmlv * 0.42;
      }
      if (moreLevelSemill.level == "C") {
        semill = semill + smmlv * 0.38;
      }
      if (moreLevelSemill.level == "RECONOCIDO POR COLCIENCIAS") {
        semill = semill + smmlv * 0.33;
      }
      if (moreLevelSemill.level == "SEMILLERO") {
        semill = semill + smmlv * 0.19;
      }

    if (mostRecentComp.level == "DOCTORADO") {
      post = post + smmlv * 0.90;
    } else if (mostRecentComp.level == "MAESTRIA") {
      post = post + smmlv * 0.45;
    } else if (mostRecentComp.level == "ESPECIALIZACION") {
      post = post + smmlv * 0.10;
    }
    if (mostRecentComp.level == "POSTDOCTORADO") {
      post = post + smmlv * 0;
    }

    if (type == "Auxiliar Tiempo Completo") {
      base = base + smmlv * 2.645;
    }

    if (type == "Auxiliar Medio Tiempo") {
      base = base + smmlv * 1.509;
    }

    if (type == "Asistente Tiempo Completo") {
      base = base + smmlv * 3.125;
    }

    if (type == "Asistente Medio Tiempo") {
      base = base + smmlv * 1.749;
    }

    if (type == "Asociado Tiempo Completo") {
      base = base + smmlv * 3.606;
    }

    if (type == "Asociado Medio Tiempo") {
      base = base + smmlv * 1.990;
    }
    if (type == "Titular Tiempo Completo") {
      base = base + smmlv * 3.918;
    }
    if (type == "Titular Medio Tiempo") {
      base = base + smmlv * 2.146;
    }

    fin = base + semill + post;
    return fin.toString();
  }

  Future<List<double>> postgrados() async{
    List<double> postgra = [];
    await Future.delayed(const Duration(seconds: 2));

    double espe = 0;
    double maes = 0;
    double doc = 0;
    double posdoc = 0;
      postgradoslistAux.forEach((docente) {
        docente.postgrado.forEach((postgrado) {
          if (postgrado.level == "ESPECIALIZACION") {
            espe = espe + 1;
          }
          if (postgrado.level == "MAESTRIA") {
            maes = maes + 1;
          }
          if (postgrado.level == "DOCTORADO") {
            doc = doc + 1;
          }
          if (postgrado.level == "POSTDOCTORADO") {
            posdoc = posdoc + 1;
          }
        });
      });
  postgra = [espe, maes,doc,posdoc];
    return postgra;
  }
  Future<List<double>> tipos() async{
    List<double> tipos = [];
    await Future.delayed(const Duration(seconds: 2));

    double auxTiempoCompleto = 0;
    double auxMedioTiempo = 0;
    double asisTiempoCompleto = 0;
    double asismediotiempo = 0;
    double asotiempocompleto = 0;
    double asomediotiempo = 0;
    double titiempocompleto = 0;
    double titmediotiempo = 0;

      postgradoslistAux.forEach((docente) {
          if (docente.type == "Auxiliar Tiempo Completo") {
            auxTiempoCompleto = auxTiempoCompleto + 1;
          }
          if (docente.type == "Auxiliar Medio Tiempo'") {
            auxMedioTiempo = auxMedioTiempo + 1;
          }
          if (docente.type == "Asistente Tiempo Completo") {
            asisTiempoCompleto = asisTiempoCompleto + 1;
          }
          if (docente.type == "Asistente Medio Tiempo") {
            asismediotiempo = asismediotiempo + 1;
          }
          if (docente.type == "Asociado Tiempo Completo") {
            asotiempocompleto = asotiempocompleto + 1;
          }
          if (docente.type == "Asociado Medio Tiempo") {
            asomediotiempo = asomediotiempo + 1;
          }
          if (docente.type == "Titular Tiempo Completo") {
            titiempocompleto = titiempocompleto + 1;
          }
          if (docente.type == "Titular Medio Tiempo") {
            titmediotiempo = titmediotiempo + 1;
          }
      });
  tipos = [auxTiempoCompleto, auxMedioTiempo,asisTiempoCompleto,asismediotiempo,asotiempocompleto,asomediotiempo,titiempocompleto,titmediotiempo];
    return tipos;
  }

  Future<List<double>> semilleros() async{
    List<double> semille = [];
    double a1 = 0;
    double a = 0;
    double b = 0;
    double c = 0;
    double rec = 0;
    double s = 0;
          postgradoslistAux.forEach((docente) {
        docente.postgrado.forEach((e) {
          if (e.level == "A1") {
            a1 = a1 + 1;
          }
          if (e.level == "A") {
            a = a + 1;
          }
          if (e.level == "B") {
            b = b + 1;
          }
          if (e.level == "C") {
            c = c + 1;
          }
          if (e.level == "RECONOCIDO POR COLCIENCIAS") {
            rec = rec + 1;
          }
          if (e.level == "SEMILLERO") {
            s = s + 1;
          }
        });
      });
    semille = [a1, a, b, c, rec, s];
    return semille;
  }

  double totalList(List<double> list) {
    double max = 0;
    list.forEach((element) {
      
      if(element > max){
        max = element+1;
      }
    });
    return max;
  }

  // guardarDocente(Docente docente) {
  //   _storage[docente.id] = json.encode(docente.toJSONEncodable());
  //   print(_storage);
  // }

  // por corregir get

  // Future<List<Docente>> mostrarDocentes() async {
  //   List<Docente> docentes = [];
  //   // _storage..remove("GetStorage");
  //   var datas = _storage.values.first;
  //   print(datas);
  //   var complementosString = datas.substring((datas.indexOf('[')+1), datas.indexOf(']')).replaceAll('{', '').replaceAll('"', '');
  //   List<String> compleList = complementosString.split('}');
  //   compleList.removeLast();

  //   var first = datas.replaceAll('{', '');
  //   first = first.replaceAll('}', '').substring(0,(first.indexOf("postgrado")-2)).replaceAll('"', '');
  //   List<String> values = first.split(',');

  //   for (var i = 0; i < values.length; i++) {
  //     List<Complemento> completosAux = [];
  //     for (var j = 0; j < compleList.length; j++) {
  //       completosAux.add(Complemento(nombre: compleList[j].split(':')[1].toString(), level: compleList[j].split(':')[3].toString()));
  //     }
  //           Docente(name: values[0].split(':')[1].toString(), id: values[1].split(':')[1].toString(), type: values[2].split(':')[1].toString(), postgrado: completosAux);
  //   }

  //   // for (var item in datas) {
  //     // print(item);
  //     // var data = json.decode(item);
  //     // List<Complemento> complementosAux = [];
  //     // for (var val in data["postgrado"]) {
  //       // complementosAux.add(Complemento(nombre: val["nombre"], level: val["level"]));
  //     // }

  //   // }
  //   print(docentes);
  //   return docentes;
  // }
}
