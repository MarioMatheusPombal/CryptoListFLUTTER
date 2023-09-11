import '../models/moeda.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(
      icone: '../../images/bitcoin.png',
      nome: 'Bitcoin',
      sigla: 'BTC',
      preco: 164.00,
    ),
    Moeda(
      icone: '../../images/ethereum.png',
      nome: 'Ethereum',
      sigla: 'ETH',
      preco: 16.00,
    ),
    Moeda(
      icone: '../../images/solana.png',
      nome: 'Solana',
      sigla: 'SOL',
      preco: 5.00,
    ),
    Moeda(
      icone: '../../images/cardano.png',
      nome: 'Cardano',
      sigla: 'ADA',
      preco: 2.00,
    ),
  ];
}
