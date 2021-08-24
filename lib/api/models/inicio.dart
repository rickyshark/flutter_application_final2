class Inicio {
  late double indiceAcademico;
  late double balancePendiente;
  late int cantidadDeMaterias;
  late int temperaturaActual;

  Inicio(
      {required this.indiceAcademico,
      required this.balancePendiente,
      required this.cantidadDeMaterias,
      required this.temperaturaActual});

  Inicio.fromJson(Map<String, dynamic> json) {
    indiceAcademico = json['indice_academico'];
    balancePendiente = json['balance_pendiente'];
    cantidadDeMaterias = json['cantidad_de_materias'];
    temperaturaActual = json['temperatura_actual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['indice_academico'] = this.indiceAcademico;
    data['balance_pendiente'] = this.balancePendiente;
    data['cantidad_de_materias'] = this.cantidadDeMaterias;
    data['temperatura_actual'] = this.temperaturaActual;
    return data;
  }
}
