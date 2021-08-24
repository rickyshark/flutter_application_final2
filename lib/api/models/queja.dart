class Queja {
  late String id;
  late String fecha;
  late String usuario;
  late String queja;
  late String estado;

  Queja({required this.id, required this.fecha, required this.usuario, required this.queja, required this.estado});

  Queja.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fecha = json['fecha'];
    usuario = json['usuario'];
    queja = json['queja'];
    estado = json['estado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fecha'] = this.fecha;
    data['usuario'] = this.usuario;
    data['queja'] = this.queja;
    data['estado'] = this.estado;
    return data;
  }
}
