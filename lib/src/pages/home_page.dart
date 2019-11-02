import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/productos_provider.dart';
import 'package:peliculas/src/widgets/banner_swiper_widget.dart';
import 'package:peliculas/src/widgets/productos_horizontal.dart';
// api-marketplace.komercia.co/api/products/by/city/1
// foto_cloudinary

class HomePage extends StatelessWidget {
  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Komercia', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black87,
            onPressed: (){},
          ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            color: Colors.black87,
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black87,
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperBanner(),
            _swiperProducts(context),
          ],
        ),
      ),
    );
  }

  Widget _swiperBanner() {

    return BannerSwiper(banners: [1,2,3]);
  }

  Widget _swiperProducts(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text('Productos', style: Theme.of(context).textTheme.subhead),
          FutureBuilder(
            future: productosProvider.getByCity(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ProductosHorizontal( productos: snapshot.data );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}