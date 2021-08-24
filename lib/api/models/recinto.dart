class Recinto {
  late String cod;
  late String txt;

  Recinto({required this.cod, required this.txt});

  Recinto.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    txt = json['txt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod'] = this.cod;
    data['txt'] = this.txt;
    return data;
  }
}
