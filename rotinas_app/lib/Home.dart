import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Detalhes.dart';
import 'Sobre.dart';
import 'CadastroRotina.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final SharedPreferences _prefs;
  dynamic _context;

  @override
  Widget build(BuildContext context){
    this._context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text('RotinasApp'),
        backgroundColor: Colors.teal,
      ),
      body: _body(),
    );
  }

  _body(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _card('Saúde Física'),
          _card('Saúde Mental'),
          _card('Desenvolvimento Pessoal'),
          _card('Desenvolvimento Profissional'),
          _card('Finanças Pessoais'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () => Navigator.pushReplacement(_context, MaterialPageRoute(builder: (_context) => Sobre())),
                backgroundColor: Colors.teal,
                child: Icon(Icons.question_mark),
              ),
              FloatingActionButton(
                onPressed: () => Navigator.pushReplacement(_context, MaterialPageRoute(builder: (_context) => CadastroRotina())),
                backgroundColor: Colors.teal,
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }

  apertarCard(nome){
    salvarInfo(nome);
    return Navigator.pushReplacement(_context, MaterialPageRoute(builder: (_context) => Detalhes()));
  }

  salvarInfo(nome) async{
    _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('categoria', nome);
  }

  _card(nome){
    return Card(
      child: InkWell(
        splashColor: Colors.teal,
        onTap: () => apertarCard(nome),
        child: SizedBox(
          width: 300,
          height: 70,
          child: Text(nome),
        ),
      ),
    );
  }
}