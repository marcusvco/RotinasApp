import 'package:flutter/material.dart';
import 'Perfil.dart';
import 'Home.dart';
import 'CadastroRotina.dart';

class Detalhes extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Detalhes'),
        actions: [
          FloatingActionButton(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home())),
            mini: true,
            backgroundColor: Colors.black26,
            child: Icon(Icons.house),
          ),
          FloatingActionButton(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Perfil())),
            mini: true,
            backgroundColor: Colors.black26,
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: _body(context),
    );
  }

  _body(context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          resumo(),
          relatorio(context),
          Container(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: Colors.teal,
              child: Icon(Icons.add),
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CadastroRotina(),)),
            ),
          ),
        ],
      ),
    );
  }

  resumo(){
    return Card(
      child: SizedBox(
        width: 300,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Title(color: Colors.black, child: Text('Rotina', style: TextStyle(fontSize: 20,),)),
            Column(
              children: [
                Text('Feito', style: TextStyle(fontSize: 18),),
                Text('30', style: TextStyle(fontSize: 18),),
              ],
            ),
            Column(
              children: [
                Text('Meta', style: TextStyle(fontSize: 18),),
                Text('20', style: TextStyle(fontSize: 18),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  relatorio(context){
    return Card(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Title(color: Colors.black, child: Text('Relatórios:', style: TextStyle(fontSize: 28),)),
            Text('* 28/08/2022 - 5h', style: TextStyle(fontSize: 20),),
            Text('* 25/08/2022 - 7h', style: TextStyle(fontSize: 20),),
            Text('* 15/08/2022 - 10h', style: TextStyle(fontSize: 20),),
            Text('* 10/08/2022 - 3h', style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}