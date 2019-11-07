import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/signIn.dart';





class SignPage extends StatefulWidget {

  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  String _email, _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: Padding(
          padding: EdgeInsets.only(left: 23.0, top: 15),
          child: FlatButton(
            onPressed: () {
              navigateToSignIn();
            },
            child: Container(
              child: Text('Login',
                style: TextStyle(
                  color: Color.fromRGBO(45, 45, 45, 0.38),
                  fontSize: 22.0,
                  fontFamily: "SF Pro Display",
                )
              )
            ),
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 35.0, top: 25),
            child: Container(
              child: Text('SignUp',
                style: TextStyle(
                  color: Color(0xFF2D2D2D),
                  fontSize: 22.0,
                  fontFamily: "SF Pro Display",
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              // width: size.width * 0.85,
              padding: EdgeInsets.only(right: 40.0, left: 40.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SafeArea(
                    child: Container(
                      height: 200.0,
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 0, top: 0),
                  //   child: Container(
                  //     child: Icon(Icons.account_circle,
                  //     size: 108,
                  //     ),
                  //   ),
                  // ),
                  _crearEmail(context),
                  _crearPassword(context),
                  Container (
                    padding: EdgeInsets.only(top: 29.0),
                    child: RaisedButton(
                      onPressed: signUp,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child : Container (
                        height: 60.0,
                        width: 295.0,
                        child: Center(
                          child: Text('SignUp',
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
                  ),
                  SizedBox( height: 200.0 )
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }

Widget _crearEmail(BuildContext context) {

  return Padding(
    padding: EdgeInsets.only(bottom: 30, top: 30),
    child: TextFormField(
      validator: (input) {
        if(input.isEmpty) {
          return 'Please type an email';
        }
      },
      onSaved: (input) => _email = input,
      decoration: InputDecoration(
        hintText: "ejemplo@correo.com",
        labelText: 'Correo electrónico',
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
  );

}

Widget _crearPassword(BuildContext context) {

  return Padding(
    padding: EdgeInsets.only(bottom: 0),
    child: TextFormField(
      validator: (input) {
        // print(error);
        if(input.isEmpty) {
          return 'Please type your password';
        } else if(input.length < 6) {
          return 'Your password needs to be atleast 6 characters';
        } 
      },
      onSaved: (input) => _password = input,
      decoration: InputDecoration(
        hintText: "enter your password",
        labelText: 'Password',
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
      obscureText: true,
    ),
  );

}

  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignPage(), fullscreenDialog: true));
  }

  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){
        print(e.message);
      }
    }
  }

}