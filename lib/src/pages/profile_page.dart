import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/menu_provider.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0), // here the desired height
        child: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: ListTile(
            title: Padding(
              padding: EdgeInsets.only(left: 0.0, top: 0, bottom: 10),
              child: Container(
                child: Text('Login',
                  style: TextStyle(
                    color: Color(0xFF2D2D2D),
                    fontSize: 22.0,
                    fontFamily: "SF Pro Display",
                  )
                )
              ),
            ),
            subtitle: Text('nada'),
          ),
          elevation: 0.0,
          // backgroundColor: Colors.transparent,
        ),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    // menuProvider.cargarData()
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ) {


        return ListView(
          children: _listaItems(snapshot.data),
        );
        

      },
    );

    // return ListView(
    //   children: _listaItems(),
    // );

  }

  List<Widget> _listaItems( List<dynamic> data) {

    final List<Widget> opciones = [];

    data.forEach( (opt) {

      final widgetTemp = ListTile(
        title: Text( opt['option']),
        leading: Icon(Icons.account_circle, color: Colors.blue),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {

        },
      );

      opciones..add( widgetTemp)
              ..add( Divider());
    });
    return opciones;
  }
}