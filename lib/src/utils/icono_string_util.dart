import 'package:flutter/material.dart';


final _icons = <String, IconData> {

  'account_circle' : Icons.account_circle,
  'account_box' : Icons.account_box,

};

Icon getIcon( String nombreIcono ) {

  return Icon( _icons[nombreIcono], color: Colors.black87, size: 60,);

}

Icon getIconC( String nombreIcono ) {

  return Icon( _icons[nombreIcono], color: Colors.black87, size: 60,);

}