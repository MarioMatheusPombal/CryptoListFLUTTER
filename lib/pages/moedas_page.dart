import 'package:flutter/material.dart';

import '../repositories/moeda_repository.dart';
class MoedasPage extends StatelessWidget {
  const MoedasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final tabela = MoedaRepository.tabela;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Moedas'),
      ),
      body: ListView.separated(itemBuilder: (BuildContext context, int moeda) {
        return ListTile(
          leading: Image.asset(tabela[moeda].icone),
          title: Text(tabela[moeda].nome),
          trailing: Text(tabela[moeda].preco.toString()),
        );
      }, padding: const EdgeInsets.all(15), separatorBuilder: (_,___) => const Divider(), itemCount: tabela.length));
  }
}