import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:peliculas/src/pages/home_page.dart';
import 'package:peliculas/src/pages/profile_page.dart';
import 'package:peliculas/src/pages/signUp.dart';



class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  String error = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        title: Padding(
          padding: EdgeInsets.only(left: 40.0, top: 15),
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
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0, top: 15),
            child: FlatButton(
              onPressed: () {
                navigateToSignUp();
              },
              child: Container(
                child: Text('SignUp',
                  style: TextStyle(
                    color: Color.fromRGBO(45, 45, 45, 0.38),
                    fontSize: 22.0,
                    fontFamily: "SF Pro Display",
                  ),
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
                      height: 30.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0, top: 0),
                    child: Container(
                      child: Icon(Icons.account_circle,
                      size: 108,
                      ),
                    ),
                  ),
                  _crearEmail(context),
                  _crearPassword(context),
                  Container (
                    padding: EdgeInsets.only(top: 29.0),
                    child: RaisedButton(
                      onPressed: signIn,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child : Container (
                        height: 60.0,
                        width: 295.0,
                        child: Center(
                          child: Text('Login',
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
                  Padding(
                    padding: EdgeInsets.only(top: 18.0, left: 0.0),
                    child: Container(
                      transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
                      child: Row(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () { print('nada');},
                            child: Text('Forgot Password?',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      height: 17.0,
                    ),
                  ),
                  Padding (
                    padding: EdgeInsets.only(top: 35.0),
                    child: FlatButton(
                      onPressed: () {
                        // signIn();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xFF9B9B9B))
                      ),
                      child : Container (
                        height: 60.0,
                        width: 295.0,
                        child: Center(
                          child: Text('Switch Account',
                            style: TextStyle(
                              color: Colors.black, 
                              fontSize: 16.0,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              // backgroundColor: Colors.white,
                            ),
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ),
                      color: Colors.transparent,
                      // elevation: 0.0,
                    ),
                  ),
                  SizedBox( height: 100.0 )
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
        } else if(error != '' ) {
          error = '';
          return 'La contraseña es incorrecta';
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




  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if(formState.validate()) {
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword( email: _email, password: _password );
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      } catch (e) {
        error = e.message;
        print(e.message);
      }
    } else {
      mostrarAlerta( context, 'Los datos son incorrectos');
    }
  }

  void mostrarAlerta( BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: ( context ) {
        return AlertDialog(
          title: Text('Información incorrecta'),
          content: Text(mensaje),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      }
    );
  }

  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignPage(), fullscreenDialog: true));
  }

  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(), fullscreenDialog: true));
  }

  // void signIn() async {
  //   if(_formKey.currentState.validate()){
  //     _formKey.currentState.save();
  //     try{
  //       AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user,)));
  //     }catch(e){
  //       print(e.message);
  //     }
  //   }
  // }

//   Widget _loginForm(BuildContext context) {
//     return SingleChildScrollView()
//   }
}

