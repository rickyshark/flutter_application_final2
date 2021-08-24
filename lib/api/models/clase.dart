class Clase {
  late String usuario;
  late String codigo;
  late String nombre;
  late String horario;
  late String aula;
  late String profesor;
  late String creditos;
  late String nota;

  Clase(
      {required this.usuario,
      required this.codigo,
      required this.nombre,
      required this.horario,
      required this.aula,
      required this.profesor,
      required this.creditos,
      required this.nota});

  Clase.fromJson(Map<String, dynamic> json) {
    usuario = json['usuario'];
    codigo = json['codigo'];
    nombre = json['nombre'];
    horario = json['horario'];
    aula = json['aula'];
    profesor = json['profesor'];
    creditos = json['creditos'];
    nota = json['nota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usuario'] = this.usuario;
    data['codigo'] = this.codigo;
    data['nombre'] = this.nombre;
    data['horario'] = this.horario;
    data['aula'] = this.aula;
    data['profesor'] = this.profesor;
    data['creditos'] = this.creditos;
    data['nota'] = this.nota;
    return data;
  }
}
