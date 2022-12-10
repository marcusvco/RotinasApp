import 'package:flutter/material.dart';
import 'Home.dart';

class Login extends StatelessWidget{
  TextEditingController userName = TextEditingController();
  TextEditingController senha = TextEditingController();
  dynamic _context;

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
                Text("Login", style: TextStyle(fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),),
                _textField('Username', false, userName),
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
        onPressed: _entrar,
      ),
    );
  }

  _entrar(){
    // Verificação se dados estão ok
    //
    return Navigator.pushReplacement(
        this._context, MaterialPageRoute(builder: (context) => Home()));
  }
}