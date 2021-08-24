import 'package:flutter/material.dart';
import 'package:flutter_application_final2/api/models/queja.dart';
import 'package:flutter_application_final2/page/home_page.dart';

import '/api/api.dart';
import '/api/models/recinto.dart';

class sugerenciasPage extends StatefulWidget {
  const sugerenciasPage({Key? key}) : super(key: key);

  @override
  _sugerenciasPageState createState() => _sugerenciasPageState();
}

class _sugerenciasPageState extends State<sugerenciasPage> {
  String sugerencia = '';

  Future<void> loadqeujas() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadqeujas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            TextField(
              onChanged: (value) {
                sugerencia = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Enviar sugerencia'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
                primary: Colors.green,
              ),
              onPressed: () async {
                postSugerencia(sugerencia);

                if (sugerencia == "") return;
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => HomePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
