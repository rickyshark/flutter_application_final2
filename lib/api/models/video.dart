class Video {
  late String nombre;
  late String codigo;
  late String imagen;
  late String url;

  Video({required this.nombre, required this.codigo, required this.imagen, required this.url});

  Video.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    codigo = json['codigo'];
    imagen = json['imagen'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data['codigo'] = this.codigo;
    data['imagen'] = this.imagen;
    data['url'] = this.url;
    return data;
  }
}
