import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';

class Cadastro extends StatelessWidget {
  TextEditingController userName = TextEditingController();
  TextEditingController dataNascimento = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController confirmSenha = TextEditingController();
  dynamic _context;
  dynamic isValid;

   _validaEmail() async{
    String url = "https://pozzad-email-validator.p.rapidapi.com/emailvalidator/validateEmail/${email.text}";
    Map<String, String> requestHeaders = {
      'X-RapidAPI-Key' : '8eac49a213msh80bcfbb43ae9fccp10f17djsn884aeb4fa16e',
      'X-RapidAPI-Host' : 'pozzad-email-validator.p.rapidapi.com',
    };
    http.head(url as Uri, headers: requestHeaders);
    http.Response response;
    response = await http.get(url as Uri);
    this.isValid = response.body;
  }

  _salvar() async{
    _validaEmail();
    if(isValid) {
      return Navigator.pushReplacement(
          this._context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;

    return Scaffold(
      appBar: AppBar(
        title: const Text('RotinasApp'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        margin: EdgeInsets.all(80),
        child: Center(
            child: Column(
              children: [
                Text("Cadastro", style: TextStyle(fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),),
                _textField('Username', false, userName),
                _textField('Data de Nascimento', false, dataNascimento),
                _textField('Email', false, email),
                _textField('Senha', true, senha),
                _textField('Confirmar Senha', true, confirmSenha),
                _button("Entrar"),
              ],
            )
        ),
      ),
    );
  }

  _textField(label, esconder, variavel) {
    if (esconder) {
      return Center(
        child: TextFormField(
          controller: variavel,
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
    } else {
      return Center(
        child: TextFormField(
          controller: variavel,
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

  _button(label) {
    return Center(
      child: FloatingActionButton.extended(
        backgroundColor: Colors.black54,
        label: Text(label),
        onPressed: _salvar,
      ),
    );
  }
}