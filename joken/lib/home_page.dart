import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final random = Random();  

  // ignore: prefer_const_constructors
  var _imageApp = AssetImage('images/nenhum.png');
  var _mensagem = 'Escolha uma opção abaixo';

  Map<String, String> rules = {
    "pedra": "tesoura",
    "tesoura": "papel",
    "papel": "pedra"
    };

  void _opcaoSelecionada(String escolhaUsuario){
    
    
    List<String> opcoes = ['pedra','papel','tesoura']; 

    var escolhaApp = opcoes[random.nextInt(opcoes.length)];

    switch( escolhaApp ){
      case 'pedra':
      setState(() {
        this._imageApp = AssetImage('images/pedra.png');
      });
      break;
      case 'papel':
      setState(() {
        this._imageApp = AssetImage('images/papel.png');
      });
      break;
      case 'tesoura':
      setState(() {
        this._imageApp = AssetImage('images/tesoura.png');
      });
      break;
    }

    if(rules[escolhaUsuario] == escolhaApp){
      setState(() {
        this._mensagem = 'Parabens!! Você ganhou :)';
      });
    }else if(rules[escolhaApp] == escolhaUsuario){
      setState(() {
        this._mensagem = 'Você perdeeu!';
      });
    }else{
      setState(() {
        this._mensagem = 'Empate';
      });
    }
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'JokenPo',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: const Text(
                'Escolha do App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image(image: this._imageApp),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              // ignore: prefer_const_constructors
              child: Text(
                this._mensagem,
                textAlign: TextAlign.center,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap:() => _opcaoSelecionada('pedra') ,
                  child: Image.asset(
                  'images/pedra.png',
                  height: 100,
                ),
                ),
                GestureDetector(
                  onTap:() => _opcaoSelecionada('papel') ,
                  child: Image.asset(
                  'images/papel.png',
                  height: 100,
                ),
                ),
                GestureDetector(
                  onTap:() => _opcaoSelecionada('tesoura') ,
                  child: Image.asset(
                  'images/tesoura.png',
                  height: 100,
                ),
                ),                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
