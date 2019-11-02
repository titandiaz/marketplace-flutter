import 'dart:convert';
import 'package:peliculas/src/models/product_model.dart';
import 'package:http/http.dart';

class ProductosProvider {
  
  // String _url = 'api-marketplace.komercia.co';
  // int _city = 1;

  Future<List<Producto>> getByCity() async {
    // final url = Uri.https(_url, 'api/products/by/city/1');

    final resp = await get('http://api-marketplace.komercia.co/api/products/by/city/1');
    final decodedData = json.decode(resp.body);

    final productos = new Productos.fromJsonList(decodedData['data']);

    return productos.items;
  }
}