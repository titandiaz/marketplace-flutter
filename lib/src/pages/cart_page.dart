import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/menu_provider.dart';


class CartPage extends StatefulWidget {
  
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listaP(),
    );
  }


  Widget _listaP() {

    return FutureBuilder(
      future: menuProviderP.cargarDataP(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ) {
        return ListView(
          children: <Widget>[
            Column( children: _listaItemsP(snapshot.data)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                  padding: EdgeInsets.only(top: 25.0, left: 30, bottom: 41),
                  child: Text('Subtotal:',
                    style: TextStyle(
                      color: Color(0xFF9B9B9B), 
                      fontSize: 16.0,
                      fontFamily: "SF Pro Display",
                    ),
                  ),
                ),
                Container (
                  padding: EdgeInsets.only(top: 25.0, right: 27, bottom: 41),
                  child: RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child : Container (
                      height: 40.0,
                      width: 130.0,
                      child: Center(
                        child: Text('Checkout',
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
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  List<Widget> _listaItemsP( List<dynamic> data) {

    final List<Widget> opcionesP = [];

    data.forEach( (opt) {
      final widgetTempP = Container( 
        padding: EdgeInsets.only(right: 27, left: 31.0),
        transform: Matrix4.translationValues(-0.0, 10.0, 0.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 27, left: 31.0, top: 5, bottom: 5),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 35 ),
                          child: new Image.asset( opt['image'],
                          ),
                        ),
                        Container(
                          width: 100,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 7),
                                width: 100,
                                transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                                child: Text( opt['price'],
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF2D2D2D),
                                  ),
                                )
                              ),
                              Container(
                                width: 100,
                                padding: EdgeInsets.only(bottom: 21),
                                transform: Matrix4.translationValues(0.0, -15.0, 0.0),
                                child: Text( opt['name'],
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF9B9B9B),
                                  ),
                                )
                              ),
                              Container(
                                width: 100,
                                padding: EdgeInsets.only(bottom: 5),
                                transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                                child: Text('Color: ' +  opt['color'],
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF9B9B9B),
                                  ),
                                )
                              ),
                              Container(
                                width: 100,
                                padding: EdgeInsets.only(bottom: 5),
                                transform: Matrix4.translationValues(0, -10.0, 0.0),
                                child: Text('Size: ' + opt['size'],
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF9B9B9B),
                                  ),
                                )
                              ),
                              Container(
                                width: 100,
                                padding: EdgeInsets.only(bottom: 5),
                                transform: Matrix4.translationValues(0, -10.0, 0.0),
                                child: Text('Quanty: ' +  opt['quanty'],
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF9B9B9B),
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      transform: Matrix4.translationValues(0, -65.0, 0.0),
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.black, size: 20,),
                        onPressed: () {
                          print('prueba');
                        },
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 27, left: 31.0, top: 5, bottom: 5),
              ),
              Divider(),
            ],
          ),
        ),
      );
      opcionesP..add( widgetTempP);
    });
    return opcionesP;
  }

}