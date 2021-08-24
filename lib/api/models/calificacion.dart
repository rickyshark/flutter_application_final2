class Calificacion {
  late String codigo;
  late String nombre;
  late String nota;

  Calificacion({required this.codigo, required this.nombre, required this.nota});

  Calificacion.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    nombre = json['nombre'];
    nota = json['nota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['nombre'] = this.nombre;
    data['nota'] = this.nota;
    return data;
  }
}
