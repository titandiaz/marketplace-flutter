import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/productos_provider.dart';
import 'package:peliculas/src/widgets/banner_swiper_widget.dart';
import 'package:peliculas/src/widgets/productos_horizontal.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// api-marketplace.komercia.co/api/products/by/city/1
// foto_cloudinary

class HomePage extends StatelessWidget {
  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    productosProvider.getByPage();
    return Scaffold(
      appBar: AppBar(
        title: Text('Komercia', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.black87,
          onPressed: () {},
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            color: Colors.black87,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black87,
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            _swiperBanner(),
            _swiperProducts(context),
            _swiperBanner(),
          ],
        ),
      )
      // Container(
      //   child: Column(
      //     // mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: <Widget>[
      //       _swiperBanner(),
      //       _swiperProducts(context),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _swiperBanner() {
    return BannerSwiper(banners: [1, 2, 3]);
  }

  Widget _swiperProducts(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0, top: 25.0, bottom: 10.0),
            child: Text('Lo nuevo', style: Theme.of(context).textTheme.title),
          ),
          SizedBox(height: 15.0),
          StreamBuilder(
            stream: productosProvider.productosStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ProductosHorizontal(
                  productos: snapshot.data,
                  siguientePagina: productosProvider.getByPage,
                );
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
