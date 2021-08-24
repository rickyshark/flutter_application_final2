class Noticia {
  late String fecha;
  late String titulo;
  late String imagen;
  late String resumen;
  late String contenido;

  Noticia({required this.fecha, required this.titulo, required this.imagen, required this.resumen, required this.contenido});

  Noticia.fromJson(Map<String, dynamic> json) {
    fecha = json['fecha'];
    titulo = json['titulo'];
    imagen = json['imagen'];
    resumen = json['resumen'];
    contenido = json['contenido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fecha'] = this.fecha;
    data['titulo'] = this.titulo;
    data['imagen'] = this.imagen;
    data['resumen'] = this.resumen;
    data['contenido'] = this.contenido;
    return data;
  }
}
