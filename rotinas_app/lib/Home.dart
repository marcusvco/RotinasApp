import 'package:flutter/material.dart';
import 'Perfil.dart';

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('RotinasApp'),
        backgroundColor: Colors.teal,
        actions: [
          FloatingActionButton(
            onPressed: abrirPerfil(context),
            mini: true,
            foregroundColor: Colors.teal,
            child: Icon(Icons.person),
          )
        ],
      ),
      body: _body(),
    );
  }

  abrirPerfil(context){
    Navigator.pop(context, Perfil);
  }

  _body(){
    
  }
}