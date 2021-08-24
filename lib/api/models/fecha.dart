class Fecha {
  late String fecha;
  late String nombre;

  Fecha({required this.fecha, required this.nombre});

  Fecha.fromJson(Map<String, dynamic> json) {
    fecha = json['fecha'];
    nombre = json['nombre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fecha'] = this.fecha;
    data['nombre'] = this.nombre;
    return data;
  }
}
