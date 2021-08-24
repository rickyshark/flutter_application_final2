import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_final2/api/models/calificacion.dart';
import 'package:flutter_application_final2/api/models/login.dart';
import 'package:flutter_application_final2/api/models/queja.dart';
import 'package:flutter_application_final2/views/quejas_view.dart';
import 'package:line_icons/line_icons.dart';

import '/api/api.dart';

class calificacionesView extends StatefulWidget {
  const calificacionesView({Key? key}) : super(key: key);

  @override
  _calificacionesViewState createState() => _calificacionesViewState();
}

class _calificacionesViewState extends State<calificacionesView> {
  List<Calificacion>? queja;
  Login? login = getLogin();

  Future<void> loadData() async {
    queja = await getCalificaciones();
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
      child: (queja == null)
          ? CircularProgressIndicator()
          : ListView(
              children: <Widget>[
                for (var v in queja!)
                  Card(
                    child: Column(children: [
                      Text(
                        login!.nombre,
                        style: TextStyle(fontSize: 17, color: Colors.green),
                      ),
                      Text(v.nombre),
                      Text(v.nota),
                    ]),
                  ),
              ],
            ),
    );
  }
}
