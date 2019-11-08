import 'package:flutter/material.dart';
import 'package:peliculas/src/models/product_model.dart';
import 'package:intl/intl.dart';

class ProductosHorizontal extends StatelessWidget {
  final List<Producto> productos;

  ProductosHorizontal({ @required this.productos});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      // height: 180.0,
      height: _screenSize.height * 0.3,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.35
        ),
        children: _cards(context),
      ),
    );
  }

  List<Widget> _cards(BuildContext context) {
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
                height: 180.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              toBeginningOfSentenceCase(producto.nombre.toLowerCase()),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.body1,
            )
          ],
        ),
      );
    }).toList();
  }
}