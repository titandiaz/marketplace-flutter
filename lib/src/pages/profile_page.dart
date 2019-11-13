import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/menu_provider.dart';
import 'package:peliculas/src/utils/icono_string_util.dart';


class ProfilePage extends StatefulWidget {
  
  ProfilePage({
    Key key, 
    @required this.user
    }) : super(key: key);
  final AuthResult user;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0), // here the desired height
        child: AppBar(
          titleSpacing: 0.0,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Container(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: ListTile(
                title: Padding(
                  padding: EdgeInsets.only(left: 0.0, top: 45, bottom: 0),
                  child: Container(
                    padding: EdgeInsets.only(left: 0.0, top: 0, bottom: 5),
                    child: Text('${widget.user.user.displayName}',
                      style: TextStyle(
                        color: Color(0xFF2D2D2D),
                        fontSize: 22.0,
                        fontFamily: "SF Pro Display",
                        backgroundColor: Colors.transparent,
                      )
                    )
                  ),
                ),
                subtitle: Text('View Profile',
                  style: TextStyle(
                    color: Color(0xFFE4E1E3),
                  ),
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(right: 0, top: 0),
                  child: Container(
                    padding: EdgeInsets.only(right: 15, top: 25),
                    child: getIcon('account_circle'),
                  ),
                ),
              ),
            ), 
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ) {

        return ListView(
          children: _listaItems(snapshot.data),
        );
        
      },
    );
  }

  List<Widget> _listaItems( List<dynamic> data) {

    final List<Widget> opciones = [];

    data.forEach( (opt) {
      final widgetTemp = Container( 
        padding: EdgeInsets.only(right: 10.0, left: 10.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Container(
                child: Text( opt['option'],
                 style: TextStyle(
                   fontSize: 16,
                 ),
                )
              ),
              // leading: Icon(Icons.account_circle, color: Colors.blue),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30,),
              onTap: () {
                _signOut();
                Navigator.pushNamed(context, opt['ruta'] );

              },
            ),
            Divider()
          ],
        ),
        
      );
      opciones..add( widgetTemp);
              // ..add( Divider());
    });
    return opciones;
  }

   Future <ProfilePage> _signOut()  async{
    await FirebaseAuth.instance.signOut();

  }
}