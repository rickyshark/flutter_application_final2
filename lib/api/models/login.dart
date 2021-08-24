class Login {
  late String id;
  late String usuario;
  late String recinto;
  late String nombre;
  late String apellido;
  late String carrera;
  late String correo;
  late String token;

  Login(
      {required this.id,
      required this.usuario,
      required this.recinto,
      required this.nombre,
      required this.apellido,
      required this.carrera,
      required this.correo,
      required this.token});

  Login.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usuario = json['usuario'];
    recinto = json['recinto'];
    nombre = json['nombre'];
    apellido = json['apellido'];
    carrera = json['carrera'];
    correo = json['correo'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['usuario'] = this.usuario;
    data['recinto'] = this.recinto;
    data['nombre'] = this.nombre;
    data['apellido'] = this.apellido;
    data['carrera'] = this.carrera;
    data['correo'] = this.correo;
    data['token'] = this.token;
    return data;
  }
}
