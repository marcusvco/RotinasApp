import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';
import 'Home.dart';

class Cadastro extends StatefulWidget {
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController userName = TextEditingController();
  TextEditingController dataNascimento = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController confirmSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                _button("Entrar", context),
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

  _button(label, context) {
    return Center(
      child: FloatingActionButton.extended(
        backgroundColor: Colors.black54,
        label: Text(label),
        onPressed: salvar_trocarTela(context),
      )
    );
  }

  salvar_trocarTela(context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', userName.value.toString());
    await prefs.setString('dataNascimento', dataNascimento.value.toString());
    await prefs.setString('email', email.value.toString());
    await prefs.setString('senha', senha.value.toString());
    await prefs.setString('confirmSenha', confirmSenha.value.toString());

    return Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => Home())
    );
  }
}