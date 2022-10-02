import 'package:flutter/material.dart';
import 'Perfil.dart';
import 'Home.dart';

class Sobre extends StatelessWidget{
  const Sobre({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          FloatingActionButton.extended(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())),
            label: Text('Home'),
            backgroundColor: Colors.black26,
          ),
          Title(color: Colors.black, child: Text('Sobre')),
          FloatingActionButton(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Perfil())),
            mini: true,
            foregroundColor: Colors.black26,
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
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white12,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: SizedBox(
          width: 400,
          height: 900,
          child: Center(
              child: Text(
                  'O aplicativo tem como missão ajudar os nossos usuários em suas '
                      'batlhas diárias utilizando-se da gameficação gerando mais motivação com pequenas conquistas.'
                      'Recomendamos o uso do aplicativo em todas as pequenas coisas do dia a dia, como ler mais, '
                      'economizar dinheiro, fazer exercícios físicos e etc. O limite do uso é sua criatividade.'
              ),
          ),
        ),
      ),
    );
  }
}