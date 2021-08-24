import 'package:flutter/material.dart';
import 'package:flutter_application_final2/api/models/video.dart';
import '/api/api.dart';
import '/api/models/clase_virtual.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class Video_View extends StatefulWidget {
  Video_View({Key? key}) : super(key: key);

  @override
  _Video_ViewState createState() => _Video_ViewState();
}

class _Video_ViewState extends State<Video_View> {
  List<Video>? video;

  Future<void> loadData() async {
    video = await getVideos();
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
      child: (video == null)
          ? CircularProgressIndicator()
          : ListView(
              children: <Widget>[
                for (var c in video!)
                  Card(
                    child: Column(children: [
                      ListTile(
                        title: Text('Materia: ${c.codigo} - ${c.nombre}'),
                        subtitle: Linkify(
                          onOpen: (clink) async {
                            if (await canLaunch(c.url)) {
                              await launch(c.url);
                            } else {
                              throw 'Could not launch';
                            }
                          }, //=> print("Clicked ${c.link}!"),
                          text: "Made by ${c.url}",
                        ),
                      ),
                    ]),
                  ),
              ],
            ),
    );
  }
}
