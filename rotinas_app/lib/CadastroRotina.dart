import 'package:flutter/material.dart';
import 'Home.dart';

class CadastroRotina extends StatelessWidget{

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
        ],
      ),
      body: _body(),
    );;
  }

  abrirHome(context){
    Navigator.pop(context, Home);
  }

  _body(){}
}