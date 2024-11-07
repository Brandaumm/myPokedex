import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../../domain/pokemon.dart';
import 'widgets/pokemoncapturado_card.dart'; // Importando o novo card

class MeusPokemonsPage extends StatefulWidget {
  const MeusPokemonsPage({super.key});

  @override
  _MeusPokemonsPageState createState() => _MeusPokemonsPageState();
}

class _MeusPokemonsPageState extends State<MeusPokemonsPage> {
  List<Pokemon> _capturedPokemons = [];

  @override
  void initState() {
    super.initState();
    _loadCapturedPokemons(); // Carregar os Pokémons capturados ao iniciar
  }

  Future<void> _removePokemon(int pokemonId) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/captured_pokemons.json');

    // Atualiza a lista removendo o Pokémon com o ID correspondente
    setState(() {
      _capturedPokemons.removeWhere((pokemon) => pokemon.id == pokemonId);
    });

    // Regrava o arquivo com a lista atualizada de Pokémons
    String updatedJson = json.encode(_capturedPokemons.map((pokemon) => pokemon.toJson()).toList());
    await file.writeAsString(updatedJson);

    // Mostra uma mensagem de sucesso
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Pokémon removido com sucesso!')),
    );
  }

  // Função para carregar os Pokémons capturados do arquivo
  Future<List<Pokemon>> loadCapturedPokemonsFromFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/captured_pokemons.json');

    if (await file.exists()) {
      // Lê o arquivo e converte de volta para uma lista de Pokémons
      String jsonString = await file.readAsString();
      List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => Pokemon.fromJson(json)).toList();
    }

    return []; // Retorna uma lista vazia caso o arquivo não exista
  }

  // Função para carregar os Pokémons capturados ao iniciar
  Future<void> _loadCapturedPokemons() async {
    List<Pokemon> capturedPokemons = await loadCapturedPokemonsFromFile();
    setState(() {
      _capturedPokemons = capturedPokemons; // Atualiza a lista de Pokémons capturados
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          "Meus Pokémons",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: Stack(
        children: [
          // Imagem de fundo
          Positioned.fill(
            child: Image.asset(
              'assets/pokedex.png', // Caminho da imagem no diretório assets
              fit: BoxFit.cover, // Ajuste a imagem para cobrir toda a tela
            ),
          ),
          // Conteúdo da página
          _capturedPokemons.isEmpty
              ? const Center(
                  child: Text(
                    'Você ainda não capturou nenhum Pokémon.',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Número de colunas
                    childAspectRatio: 0.75, // Aspecto do card
                  ),
                  itemCount: _capturedPokemons.length,
                  itemBuilder: (context, index) {
                    final pokemon = _capturedPokemons[index];
                    return PokemoncapturadoCard(
                      pokemon: pokemon,
                      onRemove: _removePokemon, // Passando a função de remoção
                    );
                  },
                ),
        ],
      ),
    );
  }
}
