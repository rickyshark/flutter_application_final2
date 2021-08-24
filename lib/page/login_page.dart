import 'package:flutter/material.dart';

import '/api/api.dart';
import '/api/models/recinto.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<Recinto> recintos = <Recinto>[];
  late Recinto recintoActual;
  String recinto = '';
  String usuario = '';
  String clave = '';
  String appId = '20197944';

  Future<void> loadRecintos() async {
    recintos = await getRecintos();
    recintoActual = recintos[0];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadRecintos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Align(
        alignment: Alignment(-0.1, -0.6),
        child: Text("Iniciar seccion UTESA"),
      )),
      body: Center(
        child: (recintos.isEmpty)
            ? CircularProgressIndicator()
            : ListView(
                padding: EdgeInsets.all(10),
                children: [
                  DropdownButton<Recinto>(
                    value: recintoActual,
                    items: recintos
                        .map((recinto) => DropdownMenuItem<Recinto>(
                              value: recinto,
                              child: Text('${recinto.cod} - ${recinto.txt}'),
                            ))
                        .toList(),
                    onChanged: (Recinto? newRecinto) {
                      recintoActual = newRecinto!;
                      recinto = newRecinto.cod;
                      setState(() {});
                    },
                  ),
                  TextField(
                    onChanged: (value) {
                      usuario = value;
                    },
                  ),
                  TextField(
                    onChanged: (value) {
                      clave = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text('Acceder'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      primary: Colors.green,
                    ),
                    onPressed: () async {
                      var login =
                          await postLogin(recinto, usuario, clave, appId);

                      if (login == null) return;

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (route) => false);
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
