import 'dart:convert';

import 'package:cryptolist/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _moedas = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('data/moedas.json');
    final data = await json.decode(response);
    setState(() {
      _moedas = data["moedas"];
      print("Itens: ${_moedas.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabela = MoedaRepository.tabela;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Crypto Moedas'),
        ),
        body: Column(
          children: [
            _moedas.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: _moedas.length,
                        itemBuilder: (context, index) {
                          return Card(
                            key: ValueKey(_moedas[index]["id"]),
                            margin: const EdgeInsets.all(10),
                            color: Colors.cyanAccent.shade100,
                            child: ListTile(
                              leading: Image.asset(_moedas[index]["imagem"]),
                              title: Text(_moedas[index]["nome"]),
                              subtitle: Text(_moedas[index]["preco"]),
                            ),
                          );
                        }),
                  )
                : ElevatedButton(
                    onPressed: () {
                      readJson();
                    },
                    child: const Center(child: Text("Carregar Crypto"))),
          ],
        ));
  }
}
