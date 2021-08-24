import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_final2/api/models/login.dart';
import 'package:flutter_application_final2/api/models/queja.dart';
import 'package:flutter_application_final2/views/quejas_view.dart';
import 'package:line_icons/line_icons.dart';

import '/api/api.dart';

class misQuejasView extends StatefulWidget {
  const misQuejasView({Key? key}) : super(key: key);

  @override
  _misQuejasensumViewState createState() => _misQuejasensumViewState();
}

class _misQuejasensumViewState extends State<misQuejasView> {
  List<Queja>? queja;
  Login? login = getLogin();

  Future<void> loadData() async {
    queja = await getMisQuejas();
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
                      Text(v.queja),
                      Text(v.fecha),
                    ]),
                  ),
              ],
            ),
    );
  }
}
