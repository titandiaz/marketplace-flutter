import 'dart:async';
import 'dart:convert';
import 'package:peliculas/src/models/product_model.dart';
import 'package:http/http.dart';

class ProductosProvider {
  
  // String _url = 'api-marketplace.komercia.co';
  int _page = 497;
  bool _cargando = false;

  List<Producto> _productos = new List();

  final _productosStreamController = StreamController<List<Producto>>.broadcast();

  Function(List<Producto>) get productosSink => _productosStreamController.sink.add;
  Stream<List<Producto>> get productosStream => _productosStreamController.stream;

  void disposeStreams(){
    _productosStreamController?.close();
  }

  Future<List<Producto>> getByPage() async {

    if (_cargando) return [];
    _cargando = true;
    _page++;
    // final url = Uri.https(_url, 'api/products/by/city/1');

    final resp = await get('http://api-marketplace.komercia.co/api/products?page=$_page');
    final decodedData = json.decode(resp.body);

    final productos = new Productos.fromJsonList(decodedData['data']['data']);

    final data =  productos.items;

    _productos.addAll(data);
    productosSink(_productos);

    _cargando = false;
    return data;
  }
}