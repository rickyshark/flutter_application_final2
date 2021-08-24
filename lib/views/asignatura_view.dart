import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import '/api/api.dart';
import '/api/models/pensum.dart';

class asignaturaView extends StatefulWidget {
  const asignaturaView({Key? key}) : super(key: key);

  @override
  _asignaturaViewState createState() => _asignaturaViewState();
}

class _asignaturaViewState extends State<asignaturaView> {
  Pensum? data;
  Map<int, List<Materias>>? asigantura;

  Future<void> loadData() async {
    data = await getAsignaturasPendientes();
    data!.materias.sort((a, b) => a.cuatrimestre - b.cuatrimestre);
    asigantura = groupBy(data!.materias, (Materias key) => key.cuatrimestre);
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
      child: (data == null && asigantura == null)
          ? CircularProgressIndicator()
          : ListView(
              children: [
                for (var c = 1; c <= 4; c++)
                  ...List.generate((asigantura![c]?.length ?? 0) + 1, (index) {
                    if (index == 0)
                      return Text(
                        'Cuatrimestre $c',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      );

                    final materia = asigantura![c]![index - 1];
                    return ListTile(
                      leading: Icon(
                        LineIcons.book,
                        color: Colors.green,
                      ),
                      title: Text(materia.nombre),
                    );
                  })
              ],
            ),
    );
  }
}
