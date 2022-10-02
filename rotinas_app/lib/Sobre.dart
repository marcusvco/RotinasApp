import 'package:flutter/material.dart';
import 'Perfil.dart';
import 'Home.dart';

class Sobre extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          FloatingActionButton.extended(
            onPressed: abrirHome(context),
            label: Text('Home'),
            backgroundColor: Colors.black26,
          ),
          FloatingActionButton(
            onPressed: abrirPerfil(context),
            mini: true,
            foregroundColor: Colors.black26,
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: _body(),
    );;
  }

  abrirHome(context){
    Navigator.pop(context, Home);
  }

  abrirPerfil(context){
    Navigator.pop(context, Perfil);
  }

  _body(){}
}