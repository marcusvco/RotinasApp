import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Perfil.dart';
import 'Detalhes.dart';
import 'Sobre.dart';
import 'CadastroRotina.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late String _categoria;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('RotinasApp'),
        backgroundColor: Colors.teal,
        actions: [
          FloatingActionButton(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Perfil())),
            mini: true,
            backgroundColor: Colors.black26,
            child: Icon(Icons.person),
          )
        ],
      ),
      body: _body(context),
    );
  }

  _body(context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _card('Saúde Física', context),
          _card('Saúde Mental', context),
          _card('Desenvolvimento Pessoal', context),
          _card('Desenvolvimento Proficional', context),
          _card('Finanças Pessoais', context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Sobre())),
                backgroundColor: Colors.teal,
                child: Icon(Icons.question_mark),
              ),
              FloatingActionButton(
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CadastroRotina())),
                backgroundColor: Colors.teal,
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _card(nome, context) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('categoria', nome);

    return Card(
      child: InkWell(
        splashColor: Colors.teal,
        onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Detalhes())),
        child: SizedBox(
          width: 300,
          height: 70,
          child: Text(nome),
        ),
      ),
    );
  }
}