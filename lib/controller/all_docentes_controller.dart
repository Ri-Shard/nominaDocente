import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AllDocentesController extends GetxController {
  TextEditingController nDocentes = TextEditingController();
//Tipo Docentes
  TextEditingController nAuxTc = TextEditingController();
  TextEditingController nAuxMt = TextEditingController();
  TextEditingController nAsisTc = TextEditingController();
  TextEditingController nAsisMt = TextEditingController();
  TextEditingController nAsoTc = TextEditingController();
  TextEditingController nAsoMt = TextEditingController();
  TextEditingController nTituTc = TextEditingController();
  TextEditingController nTituMt = TextEditingController();
//PostGrados
  TextEditingController nEspecializacion = TextEditingController();
  TextEditingController nMaestria = TextEditingController();
  TextEditingController nDoctorado = TextEditingController();
  TextEditingController nPostdoctorado = TextEditingController();
//Semilleros
  TextEditingController nA1 = TextEditingController();
  TextEditingController nA = TextEditingController();
  TextEditingController nB = TextEditingController();
  TextEditingController nC = TextEditingController();
  TextEditingController nReconocido = TextEditingController();
  TextEditingController nSemillero = TextEditingController();

  String calculoparcialtype() {
    double parcialtype = 0;
    double smmlv = 1000000.0;
    double auxauxtc = 0;
    double auxauxmt = 0;
    double auxasistc = 0;
    double auxasismt = 0;
    double auxasotc = 0;
    double auxasomt = 0;
    double auxtitutc = 0;
    double auxtitumt = 0;

    auxauxtc = double.parse(nAuxTc.text) * smmlv * 2.645;
    auxauxmt = double.parse(nAuxMt.text) * smmlv * 1.509;
    auxasistc = double.parse(nAsisTc.text) * smmlv * 3.125;
    auxasismt = double.parse(nAsisMt.text) * smmlv * 1.749;
    auxasotc = double.parse(nAsoTc.text) * smmlv * 3.606;
    auxasomt = double.parse(nAsoMt.text) * smmlv * 1.990;
    auxtitutc = double.parse(nTituTc.text) * smmlv * 3.918;
    auxtitumt = double.parse(nTituMt.text) * smmlv * 2.146;

    parcialtype = auxauxtc +
        auxauxmt +
        auxasistc +
        auxasismt +
        auxasotc +
        auxasomt +
        auxtitutc +
        auxtitumt;
    return parcialtype.toString();
  }

  String calculoparcialPost() {
    double smmlv = 1000000.0;
    double parcialpost = 0;

    double auxespecia = 0;
    double auxmaestria = 0;
    double auxdoctorado = 0;
    double auxpostdoctora = 0;

    auxespecia = double.parse(nEspecializacion.text) * smmlv * 0.10;
    auxmaestria = double.parse(nMaestria.text) * smmlv * 0.45;
    auxdoctorado = double.parse(nDoctorado.text) * smmlv * 0.90;
    auxpostdoctora = double.parse(nPostdoctorado.text) * smmlv * 0.0;

    parcialpost = auxespecia + auxmaestria + auxdoctorado + auxpostdoctora;
    return parcialpost.toString();
  }

  String calculoparcialSemill() {
    double smmlv = 1000000.0;
    double parcialsemill = 0;

    double auxa1 = 0;
    double auxa = 0;
    double auxb = 0;
    double auxc = 0;
    double auxreconocido = 0;
    double auxsemillero = 0;

    auxa1 = double.parse(nA1.text) * smmlv * 0.56;
    auxa = double.parse(nA.text) * smmlv * 0.47;
    auxb = double.parse(nB.text) * smmlv * 0.42;
    auxc = double.parse(nC.text) * smmlv * 0.38;
    auxreconocido = double.parse(nReconocido.text) * smmlv * 0.33;
    auxsemillero = double.parse(nSemillero.text) * smmlv * 0.19;

    parcialsemill = auxa1 + auxa + auxb + auxc + auxreconocido + auxsemillero;

    return parcialsemill.toString();
  }

  String calculoTotal() {
    double auxtype = double.parse(calculoparcialtype());
    double auxpost = double.parse(calculoparcialPost());
    double auxsemill = double.parse(calculoparcialSemill());

    double total = auxtype + auxpost + auxsemill;
    return total.toString();
  }

  bool validateQuantity(String? value) {
    bool flag = false;
    double auxauxtc = 0;
    double auxauxmt = 0;
    double auxasistc = 0;
    double auxasismt = 0;
    double auxasotc = 0;
    double auxasomt = 0;
    double auxtitutc = 0;
    double auxtitumt = 0;

    if (nAuxTc.text == " ") {
      auxauxtc = 0;
    } else {
      auxauxtc = double.parse(nAuxTc.text);
    }
    if (nAuxMt.text == " ") {
      auxauxmt = 0;
    } else {
      auxauxmt = double.parse(nAuxMt.text);
    }
    if (nAsisTc.text == " ") {
      auxasistc = 0;
    } else {
      auxasistc = double.parse(nAsisTc.text);
    }
    if (nAsisMt.text == " ") {
      auxasismt = 0;
    } else {
      auxasismt = double.parse(nAsisMt.text);
    }
    if (nAsoTc.text == " ") {
      auxasotc = 0;
    } else {
      auxasotc = double.parse(nAsoTc.text);
    }
    if (nAsoMt.text == " ") {
      auxasomt = 0;
    } else {
      auxasomt = double.parse(nAsoMt.text);
    }
    if (nTituTc.text == " ") {
      auxtitutc = 0;
    } else {
      auxtitutc = double.parse(nTituTc.text);
    }
    if (nTituMt.text == " ") {
      auxtitumt = 0;
    } else {
      auxtitumt = double.parse(nTituMt.text);
    }

    if (auxauxtc +
            auxauxmt +
            auxasistc +
            auxasismt +
            auxasotc +
            auxasomt +
            auxtitutc +
            auxtitumt >
        double.parse(nDocentes.text)) {
      flag = true;
    } else {
      flag = false;
    }

    return flag;
  }
}
