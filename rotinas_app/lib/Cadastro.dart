import 'package:flutter/material.dart';
import 'Home.dart';

class Cadastro extends StatelessWidget{

  dynamic username;
  dynamic dataNascimento;
  dynamic email;
  dynamic senha;
  dynamic senhaConfirm;

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
        title: Text("RotinasApp"),
      ),
      body: _body(context),
    );

  }

  _body(context){
    return Container(
        color: Colors.white60,
        width: 200,
        margin: EdgeInsetsDirectional.all(90),
        child: Column(
          children: [
            Text("Cadastro", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black87),),
            _textField('Username', false, username),
            _textField('Data de Nascimento', false, dataNascimento),
            _textField('Email', false, email),
            _textField('Senha', true, senha),
            _textField('Confirmar Senha', true, senhaConfirm),
            _button("Entrar", context)
          ],
        ),
    );
  }

  _textField(label, esconder, variavel){
    if(esconder){
      return Center(
        child: TextFormField(
          onChanged: (dynamic input) {
            variavel = input;
          },
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
          onChanged: (dynamic input) {
            variavel = input;
          },
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
        onPressed: onPressed(context),
      ),
    );
  }

  onPressed(context){
    Navigator.pop(context, Home);
  }
}
