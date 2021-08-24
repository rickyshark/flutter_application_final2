import 'package:flutter/material.dart';
import 'package:flutter_application_final2/views/asignatura_view.dart';
import 'package:flutter_application_final2/views/calificaciones_view.dart';
import 'package:flutter_application_final2/views/claseV_view.dart';
import 'package:flutter_application_final2/views/horario_view.dart';
import 'package:flutter_application_final2/views/misquejas_view.dart';
import 'package:flutter_application_final2/views/noticias_view.dart';
import 'package:flutter_application_final2/views/quejas_view.dart';
import 'package:flutter_application_final2/views/sugerencia_view.dart';
import 'package:flutter_application_final2/views/video_view.dart';
import 'package:line_icons/line_icons.dart';

import '/api/api.dart';
import '/api/models/login.dart';
import '/models/pagina.dart';
import '/views/inicio_view.dart';
import '/views/pensum_view.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Login? login = getLogin();

  var paginas = [
    Pagina(
      'Inicio',
      InicioView(),
    ),
    Pagina(
      'Pensum',
      PensumView(),
    ),
    Pagina(
      'Asignaturas pendientes',
      asignaturaView(),
    ),
    Pagina(
      'Clases virtuales',
      ClasesVirtuales_View(),
    ),
    Pagina(
      'Horario',
      horarioView(),
    ),
    Pagina(
      'Calificaciones',
      calificacionesView(),
    ),
    Pagina(
      'Videos',
      Video_View(),
    ),
    Pagina(
      'Quejas',
      QuejasPage(),
    ),
    Pagina(
      'Mis quejas',
      misQuejasView(),
    ),
    Pagina(
      'Noticias',
      Noticias_View(),
    ),
    Pagina(
      'Sugerencias',
      sugerenciasPage(),
    ),
  ];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Align(
        alignment: Alignment(-0.2, -0.6),
        child: Text(paginas[index].titulo),
      )),
      drawer: Drawer(
        child: ListView(
          children: [
            if (login != null)
              DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: Column(
                  children: [
                    Expanded(
                      child: Image(image: AssetImage('assets/Logo.png')),
                    ),
                    SizedBox(
                      height: 10.0,
                      width: 50.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          foregroundColor: Colors.amber,
                          backgroundColor: Colors.green,
                          child: Text(
                            login!.nombre[0] + login!.apellido[0],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${login!.nombre} ${login!.apellido}'),
                            Text('${login!.correo}'),
                            Text('${login!.recinto} - ${login!.carrera}'),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      focusNode: FocusNode(),
                      child: Text('Cerrar Sesión'),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                        setLogin(null);
                      },
                    )
                  ],
                ),
              ),
            ...List.generate(
                paginas.length,
                (i) => ListTile(
                      title: Text(paginas[i].titulo),
                      onTap: () {
                        setState(() => index = i);
                        Navigator.pop(context);
                      },
                    ))
          ],
        ),
      ),
      body: Center(
        child: paginas[index].widget,
      ),
    );
  }
}
