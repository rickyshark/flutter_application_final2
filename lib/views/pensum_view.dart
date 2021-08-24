import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';

import '/api/api.dart';
import '/api/models/pensum.dart';

class PensumView extends StatefulWidget {
  const PensumView({Key? key}) : super(key: key);

  @override
  _PensumViewState createState() => _PensumViewState();
}

class _PensumViewState extends State<PensumView> {
  Pensum? data;
  Map<int, List<Materias>>? cuatrimestreMaterias;

  Future<void> loadData() async {
    data = await getPensum();
    data!.materias.sort((a, b) => a.cuatrimestre - b.cuatrimestre);
    cuatrimestreMaterias =
        groupBy(data!.materias, (Materias key) => key.cuatrimestre);
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
      child: (data == null && cuatrimestreMaterias == null)
          ? CircularProgressIndicator()
          : ListView(
              children: [
                for (var c = 1; c <= 5; c++)
                  ...List.generate((cuatrimestreMaterias![c]?.length ?? 0) + 1,
                      (index) {
                    if (index == 0)
                      return Text(
                        'Cuatrimestre $c',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      );

                    final materia = cuatrimestreMaterias![c]![index - 1];
                    return ListTile(
                      leading: Icon(
                        LineIcons.book,
                        color: Colors.green,
                      ),
                      title: Text(materia.nombre),
                      subtitle: Text(materia.codigo),
                    );
                  })
              ],
            ),
    );
  }
}
