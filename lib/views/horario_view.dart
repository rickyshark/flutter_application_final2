import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_final2/api/models/clase.dart';
import 'package:flutter_application_final2/api/models/login.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '/api/api.dart';
import '/api/models/pensum.dart';

class horarioView extends StatefulWidget {
  const horarioView({Key? key}) : super(key: key);

  @override
  _horarioViewState createState() => _horarioViewState();
}

class _horarioViewState extends State<horarioView> {
  List<Clase>? data;
  Map<int, List<Clase>>? asigantura;
  Login? login = getLogin();

  Future<void> loadData() async {
    data = await getHorario();
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
      child: (data == null)
          ? CircularProgressIndicator()
          : ListView(
              children: <Widget>[
                for (var v in data!)
                  ListTile(
                    leading: Text(
                      login!.carrera,
                      style: TextStyle(fontSize: 17, color: Colors.green),
                    ),
                    title: Text(v.nombre),
                    subtitle: Text(v.horario),
                  ),
              ],
            ),
    );
  }
}
