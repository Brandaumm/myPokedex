import 'package:pokedex_app/domain/pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getPokemons({required int page, required int limit});
}
