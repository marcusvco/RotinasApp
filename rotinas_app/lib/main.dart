import 'package:flutter/material.dart';

main(){
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Login(),
    );
  }
}

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return _body();

  }

  _body(){
    return Scaffold(
      appBar: AppBar(
        title: Text("RotinasApp"),
      ),
      body: Container(
        color: Colors.white60,
        width: 200,
        margin: EdgeInsetsDirectional.all(90),
        child: _textField('Email', false),
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

  _button(){
    return Center(
      child: FloatingActionButton.extended(
        backgroundColor: Colors.black54,
        label: Text("Entrar"),
        onPressed: onPressed(),
      ),
    );
  }

  onPressed(){}
}
