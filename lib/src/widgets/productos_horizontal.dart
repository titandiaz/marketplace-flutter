import 'package:flutter/material.dart';
import 'package:peliculas/src/models/product_model.dart';
import 'package:intl/intl.dart';

class ProductosHorizontal extends StatelessWidget {
  final List<Producto> productos;
  final Function siguientePagina;

  ProductosHorizontal({ @required this.productos, @required this.siguientePagina});

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.35
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener((){
      if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
      height: 210.0,
      // height: _screenSize.height * 0.35,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        // children: _cards(context),
        itemCount: productos.length,
        itemBuilder: (context, i){
          return _producto(context, productos[i]);
        },
      ),
    );
  }

  Widget _producto(BuildContext context, Producto producto){
    final tarjetaProducto = Container(
        margin: EdgeInsets.only(right: 20.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: FadeInImage(
                image: NetworkImage(producto.getFotoCloudinary('300')),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160.0,
                width: 120.0,
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

      return GestureDetector(
        child: tarjetaProducto,
        onTap: (){
          Navigator.pushNamed(context, 'detalle', arguments: producto);
        },
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
                image: NetworkImage(producto.getFotoCloudinary('300')),
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