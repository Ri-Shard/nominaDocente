class Complemento {
  final String nombre;
  final String level;
  final String date;

  Complemento( {required this.date,required this.nombre, required this.level});
      toJSONEncodable() {
    Map<String, dynamic> m =  {};

    m['nombre'] = nombre;
    m['level'] = level;
    m['date'] = date;


    return m;
  }
}