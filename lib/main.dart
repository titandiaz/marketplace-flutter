import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/cart_page.dart';
import 'package:peliculas/src/pages/home_page.dart';
import 'package:peliculas/src/pages/product_datail_page.dart';
import 'package:peliculas/src/pages/profile_page.dart';
import 'package:peliculas/src/pages/profile_user_page.dart';
import 'package:peliculas/src/pages/signIn.dart';
import 'package:peliculas/src/pages/signUp.dart';
import 'package:peliculas/src/pages/wishlist_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var bloc = Provider.of<CartBloc>(context);
    // int totalCount = 0;
    // if (bloc.cart.length > 0) {
    //   totalCount = bloc.cart.values.reduce((a, b) => a + b);
    // }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MarketPlace',
      initialRoute: 'signIn',
      routes: {
        'signIn': (BuildContext context) => LoginPage(),
        '/': (BuildContext context) => HomePage(user: null),
        'signUp': (BuildContext context) => SignPage(),
        'profile': (BuildContext context) => ProfilePage(
              user: null,
            ),
        'cart': (BuildContext context) => CartPage(),
        'wishlist': (BuildContext context) => WishlistPage(),
        'detalle': (BuildContext context) => ProductoDetalle(),
        'profileUser': (BuildContext context) => ProfileUserPage(),
      },
    );
  }
}
