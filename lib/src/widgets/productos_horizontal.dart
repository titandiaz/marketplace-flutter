import 'package:flutter/material.dart';
import 'package:peliculas/src/models/product_model.dart';

class ProductosHorizontal extends StatelessWidget {
  final List<Producto> productos;

  ProductosHorizontal({ @required this.productos});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.3,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3
        ),
        children: _cards(),
      ),
    );
  }

  List<Widget> _cards() {
    return productos.map((producto) {
      return Container(
        margin: EdgeInsets.only(right: 20.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: FadeInImage(
                image: NetworkImage(producto.getFotoCloudinary()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            )
          ],
        ),
      );
    }).toList();
  }
}