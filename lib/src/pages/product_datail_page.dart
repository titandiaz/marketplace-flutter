import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:peliculas/src/models/product_model.dart';

class ProductoDetalle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Producto producto = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(context, producto),
          SliverList(
            delegate: SliverChildListDelegate([
              _nameProduct(context, producto),
              Divider(),
              _variantes(producto),
              Divider(),
              _addProduct(),
              Divider(),
              _description(producto)
            ]),
          ),
        ],
      ),
    );
  }

  Widget _crearAppBar(BuildContext context, Producto producto) {
    final _screenSize = MediaQuery.of(context).size;
    return SliverAppBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        expandedHeight: _screenSize.height * 0.7,
        iconTheme: new IconThemeData(color: Colors.black),
        floating: false,
        pinned: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.share,
              size: 20.0,
            ),
            color: Colors.black,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              const IconData(0xe805, fontFamily: 'MyFlutterApp'),
              size: 20.0,
            ),
            color: Colors.black,
            onPressed: () {},
          )
        ],
        flexibleSpace: FlexibleSpaceBar(
          title: Container(),
          background: FadeInImage(
            image: NetworkImage(producto.getFotoCloudinary('900')),
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/img/no-image.jpg'),
          ),
        ));
  }

  Widget _imageProduct(BuildContext context, Producto producto) {
    final _screenSize = MediaQuery.of(context).size;
    return Image.network(
      producto.getFotoCloudinary('900'),
      fit: BoxFit.cover,
      height: _screenSize.height * 0.6,
    );
  }

  Widget _nameProduct(BuildContext context, Producto producto) {
    return ListTile(
      title: Container(
          margin: EdgeInsets.only(top: 20.0, left: 10.0),
          child: Text(
            producto.nombre,
            style: Theme.of(context).textTheme.subhead,
          )),
      onTap: () {},
      trailing: Icon(
        const IconData(0xe808, fontFamily: 'MyFlutterApp'),
        size: 20.0,
      ),
      subtitle: Container(
        margin: EdgeInsets.only(top: 5.0, left: 10.0),
        child: Text(
          '\$${producto.precio.toString()}',
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }

  Widget _variantes(Producto producto) {
    if (producto.variantes.length != 0 &&
        producto.variantes[0]['variantes'] != '[]') {
      final List variantes = jsonDecode(producto.variantes[0]['variantes']);
      return _crearVariante(producto, variantes);
    } else {
      return Container();
    }
  }

  Widget _crearVariante(Producto producto, List variantes) {
    return SizedBox(
        height: 160.0,
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: variantes.length,
            itemBuilder: (context, index) {
              return _variante(variantes, index);
            }));
  }

  Widget _variante(List variantes, int index) {
    List combinacion = [];
    return Container(
      margin: EdgeInsets.only(left: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                variantes[index]['nombre'],
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: variantes[0]['valores'].length,
              itemBuilder: (context, i) {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      print(variantes[0]['valores'][i]);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(
                                4.0) //         <--- border radius here
                            ),
                      ),
                      child: Text(variantes[0]['valores'][i]['option']),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _description(Producto producto) {
    if (producto.productoInfo[0]['descripcion'].runtimeType != Null) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Html(
            // data: """${producto.productoInfo[0]['descripcion']}""",
            data:
                """${producto.productoInfo[0]['descripcion'].replaceAll(new RegExp(r'<br>'), '')}""",
            // padding: EdgeInsets.all(8.0),
            // backgroundColor: Colors.blueAccent,
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _addProduct() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
      child: RaisedButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Container(
            height: 50.0,
            child: Center(
              child: Text(
                'Agregar al carrito',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontFamily: "SF Pro Display",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          color: Color(0xFF323643),
        ),
    );
  }
}
