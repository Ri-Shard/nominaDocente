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
    validarVacio();
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
        validarVacio();
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
        validarVacio();

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

  bool validateQuantity() {
        validarVacio();
    bool flag = false;
    int auxauxtc = int.parse(nAuxTc.text);
    int auxauxmt = int.parse(nAuxMt.text);
    int auxasistc = int.parse(nAsisTc.text);
    int auxasismt = int.parse(nAsisMt.text);
    int auxasotc = int.parse(nAsoTc.text);
    int auxasomt = int.parse(nAsoMt.text);
    int auxtitutc = int.parse(nTituTc.text);
    int auxtitumt = int.parse(nTituMt.text);


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
  bool validateQuantityPost() {
        validarVacio();
    bool flag = false;
    int auxespecia = int.parse(nEspecializacion.text);
    int auxmaestria= int.parse(nMaestria.text);
    int auxdocto= int.parse(nDoctorado.text);
    int auxpostdocto = int.parse(nPostdoctorado.text);

    if (
            auxespecia +
            auxmaestria +
            auxdocto +
            auxpostdocto >
        double.parse(nDocentes.text)) {
      flag = true;
    } else {
      flag = false;
    }
    return flag;
  }

validarVacio (){
      if (nAuxTc.text == "") {
      nAuxTc.text = "0";
    } else {
      nAuxTc.text = nAuxTc.text;
    }
    if (nAuxMt.text == " ") {
      nAuxMt.text = "0";
    } else {
      nAuxMt.text = nAuxMt.text;
    }
    if (nAsisTc.text == " ") {
      nAsisTc.text = "0";
    } else {
      nAsisTc.text = nAsisTc.text;
    }
    if (nAsisMt.text == " ") {
      nAsisMt.text = "0";
    } else {
      nAsisMt.text = nAsisMt.text;
    }
    if (nAsoTc.text == " ") {
      nAsoTc.text = "0";
    } else {
      nAsoTc.text = nAsoTc.text;
    }
    if (nAsoMt.text == " ") {
      nAsoMt.text = "0";
    } else {
      nAsoMt.text = nAsoMt.text;
    }
    if (nTituTc.text == " ") {
      nTituTc.text = "0";
    } else {
      nTituTc.text = nTituTc.text;
    }
    if (nTituMt.text == " ") {
      nTituMt.text  = "0";
    } else {
      nTituMt.text  = nTituMt.text ;
    }
}
}
