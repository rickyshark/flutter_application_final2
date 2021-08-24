class ClaseVirtual {
  late String codigo;
  late String foto;
  late String nombre;
  late String link;

  ClaseVirtual(
      {required this.codigo,
      required this.foto,
      required this.nombre,
      required this.link});

  ClaseVirtual.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    foto = json['foto'];
    nombre = json['nombre'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['foto'] = this.foto;
    data['nombre'] = this.nombre;
    data['link'] = this.link;
    return data;
  }
}
