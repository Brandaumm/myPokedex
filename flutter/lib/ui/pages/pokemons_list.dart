import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pokedex_app/ui/pages/pokemon_details_page.dart';
import 'package:provider/provider.dart';

import '../../data/repository/pokemon_repository_impl.dart';
import '../../domain/pokemon.dart';
import 'widgets/pokemon_card.dart';

class PokemonListPage extends StatefulWidget {
  const PokemonListPage({super.key});

  @override
  State<PokemonListPage> createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  late final PokemonRepositoryImpl pokemonsRepo;
  late final PagingController<int, Pokemon> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    pokemonsRepo = Provider.of<PokemonRepositoryImpl>(context, listen: false);
    _pagingController.addPageRequestListener((pageKey) async {
      try {
        final pokemons = await pokemonsRepo.getPokemons(page: pageKey, limit: 10);
        _pagingController.appendPage(pokemons, pageKey + 1);
      } catch (e) {
        _pagingController.error = e;
        print(e);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
    "Pokédex",
    style: TextStyle(color: Colors.white), // Texto em branco
  ),
        backgroundColor: Colors.transparent,
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
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: PagedListView<int, Pokemon>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Pokemon>(
                itemBuilder: (context, pokemon, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PokemonDetailsPage(pokemon: pokemon),
                      ),
                    );
                  },
                  child: PokemonCard(pokemon: pokemon),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
