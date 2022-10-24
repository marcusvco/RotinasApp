import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Home.dart';



/*val client = OkHttpClient()

val request = Request.Builder()
    .url("https://pozzad-email-validator.p.rapidapi.com/emailvalidator/validateEmail/john@gmail.com")
    .get()
    .addHeader("X-RapidAPI-Key", "6defc7afebmshaf083fb58030b84p191bf9jsn6317b394f4c9")
    .addHeader("X-RapidAPI-Host", "pozzad-email-validator.p.rapidapi.com")
    .build()

val response = client.newCall(request).execute() */

class Cadastro extends StatelessWidget {
  TextEditingController userName = TextEditingController();
  TextEditingController dataNascimento = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController confirmSenha = TextEditingController();

  _validaEmail() async{
    String url = "https://pozzad-email-validator.p.rapidapi.com/emailvalidator/validateEmail/${email.text}";
    http.Response response;
    response = await http.get(url as Uri);
  }

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
        onPressed: () =>
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home())),
      ),
    );
  }
}