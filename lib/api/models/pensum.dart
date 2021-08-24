class Pensum {
  late String carrera;
  late List<Materias> materias;
  late String comentario;

  Pensum({required this.carrera, required this.materias, required this.comentario});

  Pensum.fromJson(Map<String, dynamic> json) {
    carrera = json['carrera'];
    if (json['materias'] != null) {
      materias = <Materias>[];
      json['materias'].forEach((v) {
        materias.add(new Materias.fromJson(v));
      });
    }
    comentario = json['comentario'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carrera'] = this.carrera;
    data['materias'] = this.materias.map((v) => v.toJson()).toList();
    data['comentario'] = this.comentario;
    return data;
  }
}

class Materias {
  late String codigo;
  late String nombre;
  late int cuatrimestre;

  Materias({required this.codigo, required this.nombre, required this.cuatrimestre});

  Materias.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    nombre = json['nombre'];
    cuatrimestre = json['cuatrimestre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['nombre'] = this.nombre;
    data['cuatrimestre'] = this.cuatrimestre;
    return data;
  }
}
