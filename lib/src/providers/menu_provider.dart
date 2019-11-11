import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';


class _MenuProvider {

  List<dynamic> opciones = [];
  List<dynamic> opcionesP = [];
  List<dynamic> opcionesW = [];

  _MenuProvider() {
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {

    final resp = await rootBundle.loadString('assets/data-profile.json');
    Map dataMap = json.decode(resp);
    opciones = dataMap['data'];

    return opciones;
  }

  Future<List<dynamic>> cargarDataP() async {

    final resp = await rootBundle.loadString('assets/data-profile.json');
    Map dataMap = json.decode(resp);
    opcionesP = dataMap['product'];

    return opcionesP;
  }

  Future<List<dynamic>> cargarDataW() async {

    final resp = await rootBundle.loadString('assets/data-profile.json');
    Map dataMap = json.decode(resp);
    opcionesW = dataMap['wishlist'];

    return opcionesW;
  }


}


final menuProvider = new _MenuProvider();
final menuProviderP = new _MenuProvider();
final menuProviderW = new _MenuProvider();