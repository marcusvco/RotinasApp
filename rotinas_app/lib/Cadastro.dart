import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'Home.dart';
import 'package:path/path.dart';

class Cadastro extends StatelessWidget {
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController confirmSenha = TextEditingController();
  dynamic _context;
  dynamic isValid;

  _recuperarBancoDados() async{
    final caminhoBD = await getDatabasesPath();
    final localBD = join(caminhoBD, "bancov2.db");

    var retorno = await openDatabase(
        localBD,
        version: 1,
        onCreate: (db, dbVersaoRecente){
          String sql = "CREATE TABLE Usuario(id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, email VARCHAR, senha VARCHAR)";
          db.execute(sql);
        }
    );
    print("Aberto " + retorno.isOpen.toString());
  }

  _salvarDados(String nome, String email, String senha) async{
    Database bd = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "nome" : nome,
      "email" : email,
      "senha" : senha
    };
    int id = await bd.insert("Usuario", dadosUsuario);
    print("Username: " + userName.toString());
    print("Salvo: $id");
  }

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

  _salvar() {
    //_validaEmail();
    _salvarDados(userName.text, email.text, senha.text);
    //if(isValid) {
      return Navigator.pushReplacement(
          this._context, MaterialPageRoute(builder: (context) => Home()));
    //}
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
                _textField('Email', false, email),
                _textField('Senha', true, senha),
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