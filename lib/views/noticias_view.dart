import 'dart:ui';

import 'package:flutter/material.dart';
import '/api/api.dart';
import '/api/models/noticia.dart';

class Noticias_View extends StatefulWidget {
  Noticias_View({Key? key}) : super(key: key);

  @override
  _Noticias_ViewState createState() => _Noticias_ViewState();
}

class _Noticias_ViewState extends State<Noticias_View> {
  String? fecha;
  String? titulo;
  String? imagen;
  String? resumen;
  String? contenido;

  List<Noticia>? noti;

  Future<void> loadData() async {
    noti = await getNoticias();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: (noti == null)
          ? CircularProgressIndicator()
          : ListView(
              children: <Widget>[
                for (var n in noti!)
                  Card(
                    child: Column(children: [
                      Text(
                        n.titulo,
                        style: TextStyle(fontSize: 15),
                      ),
                      Image.network(n.imagen),
                      Text(n.resumen),
                      Text(n.fecha)
                    ]),
                  ),
              ],
            ),
    );
  }
}
