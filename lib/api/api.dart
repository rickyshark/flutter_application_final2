import 'dart:convert';

import 'package:http/http.dart' as http;

import 'models/calificacion.dart';
import 'models/clase_virtual.dart';
import 'models/clase.dart';
import 'models/fecha.dart';
import 'models/inicio.dart';
import 'models/login.dart';
import 'models/noticia.dart';
import 'models/pensum.dart';
import 'models/queja.dart';
import 'models/recinto.dart';
import 'models/video.dart';

String _baseUrl = 'https://apps.ia3x.com/ute_app_utesa/index.php?/App';
Login? _login;

Login? getLogin() {
  return _login;
}

void setLogin(Login? newLogin) {
  _login = newLogin;
}

Future<List<Recinto>> getRecintos() async {
  var response = await get('$_baseUrl/recintos');
  var json = jsonDecode(response.body);

  if (json['success'] != true) print(json['mensaje']);

  var recintos = <Recinto>[];
  json['data'].forEach((v) {
    recintos.add(Recinto.fromJson(v));
  });

  return recintos;
}

Future<Login?> postLogin(
    String recinto, String usuario, String clave, String appId) async {
  var response = await post('$_baseUrl/login', {
    'recinto': recinto,
    'usuario': usuario,
    'clave': clave,
    'app_id': appId,
  });
  var json = jsonDecode(response.body);

  if (json['success'] != true) return null;

  _login = Login.fromJson(json['data']);
  return _login;
}

Future<Inicio> getInicio() async {
  var response = await post('$_baseUrl/inicio', {'token': _login!.token});
  var json = jsonDecode(response.body);

  if (json['success'] != true) print(json['mensaje']);

  return Inicio.fromJson(json['data']);
}

Future<Pensum> getPensum() async {
  var response = await post('$_baseUrl/pensum', {'token': _login!.token});
  var json = jsonDecode(response.body);

  if (json['success'] != true) print(json['mensaje']);

  return Pensum.fromJson(json['data']);
}

Future<Pensum> getAsignaturasPendientes() async {
  var response =
      await post('$_baseUrl/asignaturas_pendientes', {'token': _login!.token});
  var json = jsonDecode(response.body);

  if (json['success'] != true) print(json['mensaje']);

  return Pensum.fromJson(json['data']);
}

Future<List<ClaseVirtual>> getClasesVirtuales() async {
  var response =
      await post('$_baseUrl/clases_virtuales', {'token': _login!.token});
  var json = jsonDecode(response.body);

  if (json['success'] != true) print(json['mensaje']);

  var clasesVirtuales = <ClaseVirtual>[];
  json['data'].forEach((v) {
    clasesVirtuales.add(ClaseVirtual.fromJson(v));
  });

  return clasesVirtuales;
}

Future<List<Clase>> getHorario() async {
  var response = await post('$_baseUrl/horario', {'token': _login!.token});
  var json = jsonDecode(response.body);

  if (json['success'] != true) print(json['mensaje']);

  var horario = <Clase>[];
  json['data'].forEach((v) {
    horario.add(Clase.fromJson(v));
  });

  return horario;
}

Future<List<Calificacion>> getCalificaciones() async {
  var response =
      await post('$_baseUrl/calificaciones', {'token': _login!.token});
  var json = jsonDecode(response.body);

  if (json['success'] != true) print(json['mensaje']);

  var calificaciones = <Calificacion>[];
  json['data'].forEach((v) {
    calificaciones.add(Calificacion.fromJson(v));
  });

  return calificaciones;
}

Future<List<Fecha>> getCalendario() async {
  var response = await post('$_baseUrl/calendario', {'token': _login!.token});
  var json = jsonDecode(response.body);

  if (json['success'] != true) print(json['mensaje']);

  var calendario = <Fecha>[];
  json['data'].forEach((v) {
    calendario.add(Fecha.fromJson(v));
  });

  return calendario;
}

Future<List<Video>> getVideos() async {
  var response = await post('$_baseUrl/videos', {'token': _login!.token});
  var json = jsonDecode(response.body);

  if (json['success'] != true) print(json['mensaje']);

  var videos = <Video>[];
  json['data'].forEach((v) {
    videos.add(Video.fromJson(v));
  });

  return videos;
}

Future<String> postQueja(String queja) async {
  var response = await post('$_baseUrl/quejas', {
    'token': _login!.token,
    'queja': queja,
  });
  var json = jsonDecode(response.body);

  if (json['success'] != true) print(json['mensaje']);

  return json['mensaje'];
}

Future<List<Queja>> getMisQuejas() async {
  var response = await post('$_baseUrl/mis_quejas', {'token': _login!.token});
  var json = jsonDecode(response.body);

  if (json['success'] != true) print(json['mensaje']);

  var quejas = <Queja>[];
  json['data'].forEach((v) {
    quejas.add(Queja.fromJson(v));
  });

  return quejas;
}

Future<List<Noticia>> getNoticias() async {
  var response = await post('$_baseUrl/noticias', {'token': _login!.token});
  var json = jsonDecode(response.body);

  if (json['success'] != true) print(json['mensaje']);

  var noticias = <Noticia>[];
  json['data'].forEach((v) {
    noticias.add(Noticia.fromJson(v));
  });

  return noticias;
}

Future<String> postSugerencia(String sugerencia) async {
  var response = await post('$_baseUrl/sugerencias', {
    'token': _login!.token,
    'sugerencia': sugerencia,
  });
  var json = jsonDecode(response.body);

  if (json['success'] != true) print(json['mensaje']);

  return json['mensaje'];
}

Future<http.Response> get(String url, {Map<String, String>? headers}) async {
  return await http.get(Uri.parse(url), headers: headers);
}

Future<http.Response> post(String url, Map<String, dynamic> body,
    {Map<String, String>? headers}) async {
  var newHeaders = {'Content-Type': 'application/x-www-form-urlencoded'};
  newHeaders.addAll(headers ?? {});

  var newBody = '';
  body.forEach((key, value) {
    newBody += '$key=${Uri.encodeQueryComponent(value.toString())}&';
  });

  return await http.post(Uri.parse(url), headers: newHeaders, body: newBody);
}
