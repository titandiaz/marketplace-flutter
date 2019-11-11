import 'package:flutter/material.dart';


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

    return new ListView(
      children: <Widget>[
        Table(
          columnWidths: {1: FractionColumnWidth(0.5)},
          children: [
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 35, top: 20),
                      ),
                      Container(
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: new BorderRadius.circular(4.0),
                              child: Image.asset('assets/Bitmap.png', fit: BoxFit.cover,),
                            ),
                            Container(
                              transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                              padding: EdgeInsets.only(left: 110),
                              child: IconButton( icon: Icon(Icons.cancel, color: Colors.white,), iconSize: 20,
                                onPressed: () {
                                  print('object');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text( 'Beige Blazers', style: TextStyle( fontSize: 13, color: Color(0xFF9B9B9B),),),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 9),
                        child: Text( '129', style: TextStyle( fontSize: 13, color: Color(0xFF2D2D2D),),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                      ),
                      Container(
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: new BorderRadius.circular(4.0),
                              child: Image.asset('assets/Bitmap2.png', fit: BoxFit.cover,),
                            ),
                            Container(
                              transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                              padding: EdgeInsets.only(left: 110),
                              child: IconButton( icon: Icon(Icons.cancel, color: Colors.white,), iconSize: 20,
                                onPressed: () {
                                  print('object');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text( 'Crimson Swade', style: TextStyle( fontSize: 13, color: Color(0xFF9B9B9B),),),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 9),
                        child: Text( '129', style: TextStyle( fontSize: 13, color: Color(0xFF2D2D2D),),),
                      ),
                    ],
                  ),
                ),
              ]
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: new BorderRadius.circular(4.0),
                              child: Image.asset('assets/Bitmap3.png', fit: BoxFit.cover,),
                            ),
                            Container(
                              transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                              padding: EdgeInsets.only(left: 110),
                              child: IconButton( icon: Icon(Icons.cancel, color: Colors.white,), iconSize: 20,
                                onPressed: () {
                                  print('object');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text( 'Denims', style: TextStyle( fontSize: 13, color: Color(0xFF9B9B9B),),),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 9),
                        child: Text( '230', style: TextStyle( fontSize: 13, color: Color(0xFF2D2D2D),),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: new BorderRadius.circular(4.0),
                              child: Image.asset('assets/Bitmap.png', fit: BoxFit.cover,),
                            ),
                            Container(
                              transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                              padding: EdgeInsets.only(left: 110),
                              child: IconButton( icon: Icon(Icons.cancel, color: Colors.white,), iconSize: 20,
                                onPressed: () {
                                  print('object');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text( 'Beige Blazers', style: TextStyle( fontSize: 13, color: Color(0xFF9B9B9B),),),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 9),
                        child: Text( '129', style: TextStyle( fontSize: 13, color: Color(0xFF2D2D2D),),),
                      ),
                    ],
                  ),
                ),
              ]
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: new BorderRadius.circular(4.0),
                              child: Image.asset('assets/Bitmap.png', fit: BoxFit.cover,),
                            ),
                            Container(
                              transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                              padding: EdgeInsets.only(left: 110),
                              child: IconButton( icon: Icon(Icons.cancel, color: Colors.white,), iconSize: 20,
                                onPressed: () {
                                  print('object');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text( 'Beige Blazers', style: TextStyle( fontSize: 13, color: Color(0xFF9B9B9B),),),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 9),
                        child: Text( '129', style: TextStyle( fontSize: 13, color: Color(0xFF2D2D2D),),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: new BorderRadius.circular(4.0),
                              child: Image.asset('assets/Bitmap.png', fit: BoxFit.cover,),
                            ),
                            Container(
                              transform: Matrix4.translationValues(0.0, -5.0, 0.0),
                              padding: EdgeInsets.only(left: 110),
                              child: IconButton( icon: Icon(Icons.cancel, color: Colors.white,), iconSize: 20,
                                onPressed: () {
                                  print('object');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: Text( 'Beige Blazers', style: TextStyle( fontSize: 13, color: Color(0xFF9B9B9B),),),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 9),
                        child: Text( '129', style: TextStyle( fontSize: 13, color: Color(0xFF2D2D2D),),),
                      ),
                    ],
                  ),
                ),
              ]
            ),
          ]
        )
      ],
    );
  }

}