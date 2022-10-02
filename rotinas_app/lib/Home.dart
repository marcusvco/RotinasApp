import 'package:flutter/material.dart';
import 'package:rotinas_app/main.dart';
import 'main.dart';
import 'Perfil.dart';
import 'Detalhes.dart';
import 'Sobre.dart';
import 'CadastroRotina.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FirstRoute()),
            );
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}