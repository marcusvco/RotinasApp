import 'package:flutter/material.dart';
import 'Home.dart';

class CadastroRotina extends StatelessWidget{
  TextEditingController categoria = TextEditingController();
  TextEditingController nome = TextEditingController();
  TextEditingController meta = TextEditingController();
  dynamic _context;

  @override
  Widget build(BuildContext context){
    _context = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Cadastro Rotina'),
        actions: [
          FloatingActionButton(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())),
            mini: true,
            backgroundColor: Colors.black26,
            child: Icon(Icons.house),
          ),
        ],
      ),
      body: _body(context),
    );
  }

  _body(context){
    return Center(
      child: Container(
        margin: EdgeInsets.all(80),
        child: Center(
            child: Column(
              children: [
                Text("Cadastro de rotinas", style: TextStyle(fontSize: 40,
                    fontWeight: FontWeight.bold, color: Colors.teal),),
                _textField('Categoria', categoria),
                _textField('Nome Rotina', nome),
                _textField('Meta', meta),
                _button("Salvar"),
              ],
            )
        ),
      ),
    );
  }

  _textField(label, variavel) {
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

  _button(label) {
    return Center(
      child: FloatingActionButton.extended(
        backgroundColor: Colors.black54,
        label: Text(label),
        onPressed: _salvar,
      ),
    );
  }

  _salvar(){}
}