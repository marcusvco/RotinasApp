import 'package:flutter/material.dart';
import 'Cadastro.dart';
import 'Login.dart';
import 'Home.dart';

void main() {
  runApp(const MaterialApp(
    title: 'App',
    home: Principal(),
  ));
}

class Principal extends StatelessWidget {
  const Principal({super.key});

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
            child: SizedBox(
              width: 300,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton.extended(
                    backgroundColor: Colors.teal.shade400,
                    label: Text('Login'),
                    onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())),
                  ),
                  FloatingActionButton.extended(
                    backgroundColor: Colors.teal.shade400,
                    label: Text('Cadastro'),
                    onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Cadastro())),
                  ),
                ],
              ),
            ),
        ),
      ), 
    );
  }
}