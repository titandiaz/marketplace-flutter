import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


class _MenuProvider {

  List<dynamic> opciones = [];

  _MenuProvider() {
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {

    final resp = await rootBundle.loadString('assets/data-profile.json');
    Map dataMap = json.decode(resp);
    opciones = dataMap['data'];


    return opciones;

      // .then( (data) {

      //   Map dataMap = json.decode(data);
      //   print( dataMap['rutas'] );
      //   opciones = dataMap['rutas'];

      // });

  }


}


final menuProvider = new _MenuProvider();