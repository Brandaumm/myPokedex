import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart'; // Importando a biblioteca de conectividade

import '../../domain/pokemon.dart';
import '../../data/repository/pokemon_repository_impl.dart';
import 'widgets/pokemon_card.dart';

class EncontroDiarioPage extends StatefulWidget {
  const EncontroDiarioPage({super.key});

  @override
  _EncontroDiarioPageState createState() => _EncontroDiarioPageState();
}

class _EncontroDiarioPageState extends State<EncontroDiarioPage> {
  late final PokemonRepositoryImpl pokemonsRepo;
  Pokemon? _pokemon;

  // Lista para armazenar os Pokémons capturados
  List<Pokemon> _capturedPokemons = [];

  @override
  void initState() {
    super.initState();
    pokemonsRepo = Provider.of<PokemonRepositoryImpl>(context, listen: false);
    _loadCapturedPokemons(); // Carregar os Pokémons capturados ao iniciar
    _checkConnectivity(); // Verificar conectividade
  }

  // Função para salvar os Pokémons capturados no arquivo
  Future<void> saveCapturedPokemonsToFile(List<Pokemon> capturedPokemons) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/captured_pokemons.json');
    List<Map<String, dynamic>> jsonList = capturedPokemons.map((pokemon) => pokemon.toJson()).toList();
    String jsonString = json.encode(jsonList);
    await file.writeAsString(jsonString);
  }

  // Função para carregar os Pokémons capturados do arquivo
  Future<List<Pokemon>> loadCapturedPokemonsFromFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/captured_pokemons.json');
    if (await file.exists()) {
      String jsonString = await file.readAsString();
      List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => Pokemon.fromJson(json)).toList();
    }
    return []; 
  }

  // Função para carregar o Pokémon aleatório
  Future<void> _loadRandomPokemon() async {
    try {
      _pokemon = await pokemonsRepo.randomPokemon(); // Carrega o Pokémon aleatório
      setState(() {}); // Atualiza o estado após o carregamento
    } catch (e) {
      print("Erro ao carregar Pokémon aleatório: $e");
      // Caso haja erro (por exemplo, sem conexão), tentar carregar do cache
      _loadPokemonFromCache();
    }
  }

  // Função para carregar o Pokémon do cache (arquivo ou banco)
  Future<void> _loadPokemonFromCache() async {
    List<Pokemon> pokemons = await loadCapturedPokemonsFromFile();
    if (pokemons.isNotEmpty) {
      setState(() {
        _pokemon = pokemons.last; // Usa o último Pokémon capturado
      });
    }
  }

  // Função para capturar o Pokémon
  void _capturePokemon() {
    if (_capturedPokemons.length >= 6) {
      _showErrorDialog("Você já capturou 6 Pokémons!");
      return;
    }
    if (!_capturedPokemons.contains(_pokemon)) {
      _capturedPokemons.add(_pokemon!);
      print('Pokémon capturado: ${_pokemon!.name}');
      saveCapturedPokemonsToFile(_capturedPokemons);
      _showSuccessDialog("Pokémon ${_pokemon!.name} capturado com sucesso!");
      print('Lista de Pokémons capturados:');
      for (var capturedPokemon in _capturedPokemons) {
        print('ID: ${capturedPokemon.id}, Nome: ${capturedPokemon.name}');
      }
    } else {
      _showErrorDialog("Você já capturou este Pokémon!");
    }
  }

  // Função para exibir um diálogo de erro
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Função para exibir um diálogo de sucesso
  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sucesso'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Função para carregar os Pokémons capturados ao iniciar
  Future<void> _loadCapturedPokemons() async {
    List<Pokemon> capturedPokemons = await loadCapturedPokemonsFromFile();
    setState(() {
      _capturedPokemons = capturedPokemons;
    });
  }

  // Verifica a conectividade
  Future<void> _checkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("Sem conexão. Tentando carregar Pokémon do cache.");
      _loadPokemonFromCache(); // Se não houver internet, carrega do cache
    } else {
      _loadRandomPokemon(); // Se tiver internet, carrega o Pokémon aleatório
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("Encontro Diário", style: TextStyle(color: Colors.white),), 
        backgroundColor: const Color(0xFFFFFFFF),
      ),
      body: Stack(
        children: [
          // Imagem de fundo
          Positioned.fill(
            child: Image.asset(
              'assets/pokedex.png', // Caminho da imagem no diretório assets
              fit: BoxFit.cover,
            ),
          ),
          // Conteúdo da página
          _pokemon == null
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Column(
                      children: [
                        PokemonCard(pokemon: _pokemon!),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _capturePokemon,
                          child: const Text('Capturar'),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
