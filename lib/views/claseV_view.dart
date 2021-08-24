import 'package:flutter/material.dart';
import '/api/api.dart';
import '/api/models/clase_virtual.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class ClasesVirtuales_View extends StatefulWidget {
  ClasesVirtuales_View({Key? key}) : super(key: key);

  @override
  _ClasesVirtuales_ViewState createState() => _ClasesVirtuales_ViewState();
}

class _ClasesVirtuales_ViewState extends State<ClasesVirtuales_View> {
  String? codigo;
  String? foto;
  String? nombre;
  String? link;

  List<ClaseVirtual>? clase;

  Future<void> loadData() async {
    clase = await getClasesVirtuales();
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
      child: (clase == null)
          ? CircularProgressIndicator()
          : ListView(
              children: <Widget>[
                for (var c in clase!)
                  Card(
                    child: Column(children: [
                      Image.network(c.foto),
                      ListTile(
                        title: Text('Materia: ${c.codigo} - ${c.nombre}'),
                        subtitle: Linkify(
                          onOpen: (clink) async {
                            if (await canLaunch(c.link)) {
                              await launch(c.link);
                            } else {
                              throw 'Could not launch $link';
                            }
                          }, //=> print("Clicked ${c.link}!"),
                          text: "Made by ${c.link}",
                        ),
                      ),
                    ]),
                  ),
              ],
            ),
    );
  }
}
