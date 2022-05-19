import 'package:nomina_docente/models/complemento.dart';

class Docente {
  final String name;
  final String id;
  final String type;
  final String salary;  
  List<Complemento> postgrado = [];

  Docente({required this.salary, required this.name,required this.id,required this.type, required this.postgrado});
  
    toJSONEncodable() {
    Map<String, dynamic> m =  {};

    m['name'] = name;
    m['id'] = id;
    m['type'] = type;
    m['salary'] = salary;
    m['postgrado'] = toJSONEncodableList(postgrado);
    return m;
  }

      toJSONEncodableList(List<Complemento> complement) {
    List<Map<String, dynamic>> m =  [];

    for (var item in complement) {
     Map<String,dynamic> aux = {};   
    aux['nombre'] = item.nombre;
    aux['level'] = item.level;
    aux['date'] = item.date;
    m.add(aux);
    }
    return m;
  }
}