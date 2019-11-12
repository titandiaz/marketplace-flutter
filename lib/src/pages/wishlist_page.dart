import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/menu_provider.dart';


class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listaW(),
    );
  }

  Widget _listaW() {

    return FutureBuilder(
      future: menuProviderW.cargarDataW(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ) {
        return new GridView.count(
          primary: false,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          crossAxisCount: 2,
          childAspectRatio: 0.613,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          children: _listaItemsW(snapshot.data),
          shrinkWrap: true,
        );
      },
    );
  }

  List<Widget> _listaItemsW( List<dynamic> data) {

    final List<Widget> opcionesW = [];

    data.forEach( (opt) {
      final widgetTempW = Container(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: new BorderRadius.circular(4.0),
                  child: Image.asset(
                    opt['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                  padding: EdgeInsets.only(left: 110),
                  child: IconButton(
                    icon: Icon(Icons.cancel, color: Colors.white,),
                    iconSize: 20,
                    onPressed: () {
                      print('object');
                    },
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text( opt['name'],
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF9B9B9B),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 9),
                  child: Text( opt['price'],
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF2D2D2D),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
      opcionesW..add( widgetTempW);
    });
    return opcionesW;
  }


}