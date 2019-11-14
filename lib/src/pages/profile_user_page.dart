import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/profile_page.dart';


class ProfileUserPage extends StatefulWidget {

  ProfileUserPage({
    Key key, 
    @required this.user
    }) : super(key: key);
  final AuthResult user;

  @override
  _ProfileUserPageState createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _userName, error;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade300, Colors.indigo.shade500]
              ),
            ),
          ),
          ListView.builder(
            itemCount: 1,
            itemBuilder: _mainListBuilder,
          ),
        ],
      ),
    );
  }


  Widget _mainListBuilder(BuildContext context, int index) {
    return  Column(
      children: <Widget>[
        _buildHeader(context),
        _crearNombre(context),
         _boton(context)
      ],
    );
  
  }

  Container _buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      height: 240.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50.0,),
                  Text( '${widget.user.user.displayName}', style: Theme.of(context).textTheme.title,),
                  SizedBox(height: 5.0,),
                  Text("${widget.user.user.email}"),
                  SizedBox(height: 16.0,),
                  Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text("302",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text("Posts".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 10.0) ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text("10.3K",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text("Followers".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 10.0) ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text("120",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            subtitle: Text("Following".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 10.0) ),
                          ),
                        ),
                      ],
                    ),
                  )
                  
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 5.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 40.0,
                  child: Icon(Icons.account_circle),),
              ),
              
            ],
          ),
          // ListView(
          //   children: <Widget>[
          //     _crearNombre(context),
          //   ],
          // )
        ],
      ),
    );
  }

  Widget _crearNombre(BuildContext context) {

    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.only(right: 40.0, left: 40.0),
        child: Padding(
          padding: EdgeInsets.only(bottom: 0, top: 30),
            child: TextFormField(
              validator: (input) {
                if(input.isEmpty) {
                  return 'Please type your user name';
                }
              },
              onSaved: (input) => _userName = input,
              decoration: InputDecoration(
                hintText: "Dany Escobar",
                labelText: 'User Name',
                labelStyle: TextStyle(
                  color: Color(0xFF2D2D2D),
                  letterSpacing: 1.3
                ),
                contentPadding: EdgeInsets.all(17.0),
                border: OutlineInputBorder(
                  // gapPadding: 0.0,
                  borderRadius: BorderRadius.circular(4)
                )
              ),
            ),
          ),
      ),
    );

  }
  Widget _boton(BuildContext context) {

    return Container (
      padding: EdgeInsets.only(top: 29.0, bottom: 50),
      child: RaisedButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child : Container (
          height: 60.0,
          width: 249,
          child: Center(
            child: Text('Actualizar',
              style: TextStyle(
                color: Colors.white, 
                fontSize: 16.0,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
              textDirection: TextDirection.ltr,
            ),
          ),
        ),
        color: Color(0xFF323643),
      ),
    );

  }


}