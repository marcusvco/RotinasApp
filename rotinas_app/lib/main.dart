import 'package:flutter/material.dart';
import 'Cadastro.dart';

main(){
  runApp(Principal());
}

class Principal extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Cadastro(),
    );
  }
}