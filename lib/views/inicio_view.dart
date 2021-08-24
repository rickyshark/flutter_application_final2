import 'package:flutter/material.dart';

import '/api/api.dart';
import '/api/models/inicio.dart';

class InicioView extends StatefulWidget {
  const InicioView({Key? key}) : super(key: key);

  @override
  _InicioViewState createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  Inicio? data;

  Future<void> loadData() async {
    data = await getInicio();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle _titleStyle = TextStyle(fontSize: 20);
    final TextStyle _subtitleStyle = TextStyle(fontWeight: FontWeight.bold);
    return Container(
      padding: EdgeInsets.all(15),
      child: (data == null)
          ? CircularProgressIndicator()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Indice academico: ${data!.indiceAcademico}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right),
                Text('Cantidad de Materias: ${data!.cantidadDeMaterias}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right),
                Text('Balance Pendiente: RD\$ ${data!.balancePendiente} pesos',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right),
                Text('Temperatura Actual: ${data!.temperaturaActual}°',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset('assets/Logo.png'),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
