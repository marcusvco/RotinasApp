import 'package:flutter/material.dart';
import 'Home.dart';

void main() {
  runApp(const MaterialApp(
    title: 'App',
    home: Cadastro(),
  ));
}

class Cadastro extends StatelessWidget {
  const Cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RotinasApp'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        margin: EdgeInsets.all(80),
        child : Center(
            child: Column(
              children: [
                Text("Cadastro", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.teal),),
                _textField('Username', false),
                _textField('Data de Nascimento', false),
                _textField('Email', false),
                _textField('Senha', true),
                _textField('Confirmar Senha', true),
                _button("Entrar", context),
              ],
            )
        ),
      ), 
    );
  }

  _textField(label, esconder){
    if(esconder){
      return Center(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
            suffixIcon: Icon(
              Icons.visibility,
              color: Colors.black26,
            ),
            labelStyle: TextStyle(
              color: Colors.teal,
            ),
          ),
        ),
      );
    }else{
      return Center(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
              color: Colors.teal,
            ),
          ),
        ),
      );
    }
  }

  _button(label, context){
    return Center(
      child: FloatingActionButton.extended(
        backgroundColor: Colors.black54,
        label: Text(label),
        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())),
      ),
    );
  }
}