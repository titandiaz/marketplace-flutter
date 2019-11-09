import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/menu_provider.dart';


class CartPage extends StatefulWidget {
  
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final price = '129';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          title: Center(
            child: Container(
              // color: Colors.red,
              padding: EdgeInsets.only(top: 12.0),
              transform: Matrix4.translationValues(-30.0, 0.0, 0.0),
              child: Text('Shoping Bag',
                style: TextStyle(
                  color: Color(0xFF2D2D2D),
                  fontSize: 22.0,
                  fontFamily: "SF Pro Display",
                )
              ),
            ),
          ),
          leading: IconButton(
            padding: EdgeInsets.only(top: 10.0),
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black87,
            onPressed: () {},
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
      body: _listaP(),
      // ListView(
      //   children: <Widget>[
      //     FloatingActionButton( child: Icon(Icons.exposure_zero), onPressed: null ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         Container(
      //           transform: Matrix4.translationValues(0.0, 0.0, 0.0),
      //           padding: EdgeInsets.only(top: 29.0, left: 31),
      //           child: Text('Subtotal:',
      //             style: TextStyle(
      //               color: Color(0xFF9B9B9B), 
      //               fontSize: 16.0,
      //               fontFamily: "SF Pro Display",
      //             ),
      //           ),
      //         ),
      //         Container (
      //           padding: EdgeInsets.only(top: 29.0, right: 27),
      //           child: RaisedButton(
      //             onPressed: () {},
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(4.0),
      //             ),
      //             child : Container (
      //               height: 40.0,
      //               width: 130.0,
      //               child: Center(
      //                 child: Text('Checkout',
      //                   style: TextStyle(
      //                     color: Colors.white, 
      //                     fontSize: 16.0,
      //                     fontFamily: "SF Pro Display",
      //                     fontWeight: FontWeight.w600,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             color: Color(0xFF323643),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      // _listaP(),
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
                padding: EdgeInsets.only(top: 29.0, left: 31),
                child: Text('Subtotal:',
                  style: TextStyle(
                    color: Color(0xFF9B9B9B), 
                    fontSize: 16.0,
                    fontFamily: "SF Pro Display",
                  ),
                ),
              ),
              Container (
                padding: EdgeInsets.only(top: 29.0, right: 27),
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
          
          // children: _listaItemsP(snapshot.data),
        );
        
      },
    );
  }

  List<Widget> _listaItemsP( List<dynamic> data) {

    final List<Widget> opcionesP = [];

    data.forEach( (opt) {
      final widgetTempP = Container( 
        padding: EdgeInsets.only(right: 27.0, left: 31.0),
        // color: Colors.red,
        child: Container(
          // color: Colors.blue,
          // padding: EdgeInsets.only(right: 27.0, left: 31.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Container(
                  transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                  child: Text( opt['price'],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  )
                ),
                trailing: Container(
                  transform: Matrix4.translationValues(22.0, 0.0, 0.0),
                  child: Icon(Icons.close, color: Colors.black, size: 30,),
                ),
                
              ),
              ListTile(
                title: Container(
                  transform: Matrix4.translationValues(-17.0, 0.0, 0.0),
                  child: Text( opt['name'],
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  )
                ),
                // leading: Icon(Icons.account_circle, color: Colors.blue),
                // trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30,),
              ),
              Divider(),
            ],
          ),
        ),
        
      );
      opcionesP..add( widgetTempP);
              // ..add( Divider());
    });
    return opcionesP;
  }
  
}