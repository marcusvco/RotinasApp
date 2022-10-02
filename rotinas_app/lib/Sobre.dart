import 'package:flutter/material.dart';
import 'Perfil.dart';
import 'Home.dart';

class Sobre extends StatelessWidget{
  const Sobre({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        backgroundColor: Colors.teal,
        actions: [
          FloatingActionButton(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())),
            mini: true,
            backgroundColor: Colors.black26,
            child: Icon(Icons.house),
          ),
          FloatingActionButton(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Perfil())),
            mini: true,
            backgroundColor: Colors.black26,
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: _body(context),
    );;
  }

  _body(context){
    return Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 500,
          child: Center(
              child: Text(
                  'O aplicativo tem como missão ajudar os nossos usuários em suas '
                      'batlhas diárias utilizando-se da gameficação gerando mais motivação com pequenas conquistas.'
                      'Recomendamos o uso do aplicativo em todas as pequenas coisas do dia a dia, como ler mais, '
                      'economizar dinheiro, fazer exercícios físicos e etc. O limite do uso é sua criatividade.',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,
              ),
          ),
        ),
      ),
    );
  }
}