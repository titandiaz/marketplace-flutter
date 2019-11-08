import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:peliculas/src/pages/signIn.dart';

class User {
  const User(this.name);

  final String name;
}

class SignPage extends StatefulWidget {

  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final myController = TextEditingController();


  // _printLatestValue() {
  //   // print("Second text field: ${myController.text}");
  //   // print(myController.text);
  // }
  

  // @override
  // void initState() {
  //   super.initState();
  //   myController.addListener(_printLatestValue);
  // }

  // @override
  // void dispose() {
  //   myController.removeListener(_printLatestValue);    
  //   myController.dispose();
  //   super.dispose();
  // }


  String _email, _password, _userName, _confirmPassword, _city, error;
  User selectedUser;
  List<User> users = <User>[const User('Villavicencio'), const User('Bogota'), const User('Medellin'), const User('Cartagena'),];

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
               Navigator.of(context).pop();
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
                      height: 30.0,
                    ),
                  ),
                  _crearNombre(context),
                  _crearEmail(context),
                  _crearPassword(context),
                  _crearConfirmPassword(context),
                  _crearCiudad(context),
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
                  SizedBox( height: 100.0 )
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }

Widget _crearNombre(BuildContext context) {

  return Padding(
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
    padding: EdgeInsets.only(bottom: 30.0),
    child: TextFormField(
      controller: myController,
      validator: (input) {
        // print(myController.text);
        if(input.isEmpty) {
          return 'Please type your password';
        } else if(input.length < 6) {
          return 'Your password needs to be atleast 6 characters';
        } 
      },
      onSaved: (input) {
        _password = input;
      },
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

Widget _crearConfirmPassword(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(bottom: 20),
    child: TextFormField(
      validator: (input) {
        // print("Second text field: ${myController.text}");
        if(input == myController.text) {
          // return 'Bien';
        } else {
          return 'Tu contraseña debe coincidir';
        }
      },
      onSaved: (input) => _confirmPassword = input,
      decoration: InputDecoration(
        hintText: "enter your password again",
        labelText: 'Confirm Password',
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

Widget _crearCiudad(BuildContext context) {

  return Padding(
    padding: EdgeInsets.only(bottom: 0),
    child: Center( 
      child: Container(
        width: 295.0,
        child: DropdownButton<User>(
        // elevation: 0,
          hint: Text("Select your city"),
          value: selectedUser,
          onChanged: (User newValue) {
            setState(() {
              selectedUser = newValue;
            });
          },
          items: users.map((User user) {
            return DropdownMenuItem<User>(
              value: user,
              child: Text(
                user.name,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
        ),
      ),
      // width: 295.0,
      // height: 60.0,
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
    // final auth = Provider.of(context).auth;
    
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await createUserWithEmailAndPassword( _email, _password, _userName);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
        
      }catch(e){
        error = e.message;
        print(e.message);
      }
    }
  }

  Future<String> createUserWithEmailAndPassword(String email, String password,
      String name) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Update the username
    await updateUserName(name, authResult.user);
    return authResult.user.uid;
  }

  Future updateUserName(String name, FirebaseUser currentUser) async {
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
  }

  // void mostrarAlerta( BuildContext context, String mensaje) {
  //   showDialog(
  //     context: context,
  //     builder: ( context ) {
  //       return AlertDialog(
  //         title: Text('Información incompleta'),
  //         content: Text(mensaje),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('Ok'),
  //             onPressed: () => Navigator.of(context).pop(),
  //           )
  //         ],
  //       );
  //     }
  //   );
  // }

}