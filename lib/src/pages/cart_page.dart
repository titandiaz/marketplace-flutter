import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/menu_provider.dart';
import 'package:peliculas/src/utils/icono_string_util.dart';
import 'package:peliculas/src/widgets/banner_swiper_widget.dart';


class CartPage extends StatefulWidget {
  
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          title: Center(
            child: Container(
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
      bottomNavigationBar: _botttomNavigationBar(context),
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
                padding: EdgeInsets.only(top: 35.0, left: 30, bottom: 41),
                child: Text('Subtotal:',
                  style: TextStyle(
                    color: Color(0xFF9B9B9B), 
                    fontSize: 16.0,
                    fontFamily: "SF Pro Display",
                  ),
                ),
              ),
              Container (
                padding: EdgeInsets.only(top: 35.0, right: 27, bottom: 41),
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
        // color: Colors.red,
        child: Container(
          padding: EdgeInsets.only(top: 20),
          // color: Colors.blue,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      transform: Matrix4.translationValues(-16.0, -0.0, 0.0),
                      // color: Colors.yellow,
                      width: 111,
                      height: 148,
                      child: new Image.asset( opt['image'],
                          width: 80.0,
                          height: 100.0, 
                          ),
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          // color: Colors.yellow,
                          padding: EdgeInsets.only(bottom: 7),
                          transform: Matrix4.translationValues(-5.0, -17.0, 0.0),
                          child: Text( opt['price'],
                          style: TextStyle(
                            fontSize: 13,
                          ),
                          )
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 21),
                          transform: Matrix4.translationValues(30.0, -15.0, 0.0),
                          child: Text( opt['name'],
                          style: TextStyle(
                            fontSize: 13,
                          ),
                          )
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 5),
                          transform: Matrix4.translationValues(20.0, -10.0, 0.0),
                          child: Text('Color: ' +  opt['color'],
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 5),
                          transform: Matrix4.translationValues(12, -10.0, 0.0),
                          child: Text('Size: ' + opt['size'],
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          )
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 5),
                          transform: Matrix4.translationValues(13.0, -10.0, 0.0),
                          child: Text('Quanty: ' +  opt['quanty'],
                          style: TextStyle(
                            fontSize: 13,
                          ),
                          )
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Container(
                  transform: Matrix4.translationValues(20.0, -30.0, 0.0),
                  child: Container(
                    child: IconButton(
                    icon: Icon(Icons.close, color: Colors.black, size: 20,),
                    onPressed: () {
                      print('object');
                    },
                  ),
                  ),
                ),
              ),
              Divider(
                height: 60.0,
                // color: Colors.yellow,
              ),
            ],
          ),
        ),
        
      );
      opcionesP..add( widgetTempP);
    });
    return opcionesP;
  }

  Widget _swiperBanner() {
    return BannerSwiper(banners: [0]);
  }
  
  Widget _botttomNavigationBar(BuildContext context) {
    
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black
      ),
      child: BottomNavigationBar(
        onTap: (newIndex) => setState(() => index = newIndex),
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(const IconData(0xe804, fontFamily: 'MyFlutterApp'), size: 20.0,),
            title: Text('Inicio', style: TextStyle(fontSize: 13, color: Colors.black),),
          ),
          BottomNavigationBarItem(
            icon: Icon(const IconData(0xe805, fontFamily: 'MyFlutterApp'), size: 20.0, ),
            title: Text('Carrito', style: TextStyle(fontSize: 13, color: Colors.black),)
          ),
          BottomNavigationBarItem(
            icon: Icon(const IconData(0xe806, fontFamily: 'MyFlutterApp'), size: 20.0,),
            title: Text('Perfil', style: TextStyle(fontSize: 13, color: Colors.black),)
          ),
        ],
        
      ),
    );
  }

}