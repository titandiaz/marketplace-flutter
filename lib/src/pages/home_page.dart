import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/cart_page.dart';
import 'package:peliculas/src/pages/profile_page.dart';
import 'package:peliculas/src/providers/productos_provider.dart';
import 'package:peliculas/src/widgets/banner_swiper_widget.dart';
import 'package:peliculas/src/widgets/productos_horizontal.dart';
import 'package:firebase_auth/firebase_auth.dart';
// api-marketplace.komercia.co/api/products/by/city/1
// foto_cloudinary

class HomePage extends StatefulWidget {

  HomePage({ @required this.user });
  final AuthResult user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    productosProvider.getByPage();
    return Scaffold(
      appBar: AppBar(
        title: Text('Komercia', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: Icon(Icons.menu),
        //   color: Colors.black87,
        //   onPressed: () {},
        // ),
        elevation: 0.0,
        iconTheme: new IconThemeData(color: Colors.black),
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
      drawer: SizedBox(
        width: size.width - 100.0,
        child: Container(
          child: ProfilePage(user: widget.user,),
        ),
      ),
      body: _callPage(context, currentIndex),
      bottomNavigationBar: _botttomNavigationBar(context)
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

  Widget _callPage(BuildContext context, int paginaActual) {
    switch (paginaActual) {
      case 0: return Center(
        child: ListView(
          children: <Widget>[
            _swiperBanner(),
            _swiperProducts(context),
            _swiperBanner(),
          ],
        ),
      );
      case 1 : return CartPage();
      case 3 : return ProfilePage(user: widget.user);
      
      default: return Center(
        child: ListView(
          children: <Widget>[
            _swiperBanner(),
            _swiperProducts(context),
            _swiperBanner(),
          ],
        ),
      );
    }
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

  Widget _botttomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
        textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Colors.black26))
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.transparent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(const IconData(0xe804, fontFamily: 'MyFlutterApp'), size: 20.0,),
            title: Text('Inicio', style: TextStyle(fontSize: 13),)
          ),
          BottomNavigationBarItem(
            icon: Icon(const IconData(0xe805, fontFamily: 'MyFlutterApp'), size: 20.0,),
            title: Text('Carrito', style: TextStyle(fontSize: 13),)
          ),
          BottomNavigationBarItem(
            icon: Icon(const IconData(0xe808, fontFamily: 'MyFlutterApp'), size: 20.0,),
            title: Text('Favoritos', style: TextStyle(fontSize: 13),)
          ),
          BottomNavigationBarItem(
            icon: Icon(const IconData(0xe806, fontFamily: 'MyFlutterApp'), size: 20.0,),
            title: Text('Perfil', style: TextStyle(fontSize: 13),)
          ),
        ],
      ),
    );
  }
}
