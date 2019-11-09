import 'package:flutter/material.dart';


final _icons = <String, IconData> {

  'account_circle' : Icons.account_circle,

};

Icon getIcon( String nombreIcono ) {

  return Icon( _icons[nombreIcono], color: Colors.black87, size: 60,);

}