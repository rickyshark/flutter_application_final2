import 'package:flutter/material.dart';
import 'package:flutter_application_final2/api/models/queja.dart';
import 'package:flutter_application_final2/page/home_page.dart';

import '/api/api.dart';
import '/api/models/recinto.dart';

class QuejasPage extends StatefulWidget {
  const QuejasPage({Key? key}) : super(key: key);

  @override
  _QuejasPageState createState() => _QuejasPageState();
}

class _QuejasPageState extends State<QuejasPage> {
  String queja = '';

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
                queja = value;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text('Enviar queja'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
                primary: Colors.green,
              ),
              onPressed: () async {
                postQueja(queja);

                if (queja == "") return;
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
