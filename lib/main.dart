import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:frases_do_dia/app_imagens.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = [
    'Respire fundo e fique atento às surpresas deliciosas que a vida preparou para você!',
    'Nem todos os dias são bons, mas há algo bom em cada dia.',
    'Suba o primeiro degrau com fé. Não é necessário que você veja toda a escada, apenas dê o primeiro passo.',
  ];

  var _frasesGerada = 'Clique abaixo para gerar uma frase!';

  void _gerarFrases() {
    var numeroSorteado = Random().nextInt(_frases.length);

    setState(() {
      _frasesGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Frases do dia."),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.logo,
                fit: BoxFit.fitWidth,
              ),
              Text(
                _frasesGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreen, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: _gerarFrases,
                child: Text(
                  'Nova frase',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
