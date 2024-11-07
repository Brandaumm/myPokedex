import 'dart:math';

import 'package:pokedex_app/data/database/dao/pokemon_dao.dart';
import 'package:pokedex_app/data/database/database_mapper.dart';
import 'package:pokedex_app/data/network/client/api_client.dart';
import 'package:pokedex_app/data/network/network_mapper.dart';
import 'package:pokedex_app/data/repository/pokemon_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/pokemon.dart';

class PokemonRepositoryImpl implements IPokemonRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;
  final PokemonDao pokemonDao; // DAO para o Pokémon
  final DatabaseMapper databaseMapper;

  PokemonRepositoryImpl({
    required this.pokemonDao,
    required this.databaseMapper,
    required this.apiClient,
    required this.networkMapper,
  });

Future<Pokemon> randomPokemon() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  
  // Obtém o horário e ID do Pokémon salvos
  int? horarioPrefs = prefs.getInt('horario');
  int? idPrefs = prefs.getInt('idPokemonRandom');
  
  // Verifica se já passaram 24 horas (86400000 milissegundos) desde o último Pokémon
  if (horarioPrefs != null && DateTime.now().millisecondsSinceEpoch > horarioPrefs + Duration(seconds: 5).inMilliseconds) {
    prefs.clear(); // Limpa todos os dados salvos no SharedPreferences

    // Se passaram 24 horas ou mais, gera um novo Pokémon aleatório
    final randomId = Random().nextInt(809) + 1; // Gera um ID aleatório de 1 a 809
    final networkEntity = await apiClient.getPokemonById(randomId);  // Busca o Pokémon pela API
    final pokemon = networkMapper.toPokemon(networkEntity);
    
    // Salva o novo Pokémon e horário
    prefs.setInt('idPokemonRandom', pokemon.id);  // Salva o ID do novo Pokémon
    prefs.setInt('horario', DateTime.now().millisecondsSinceEpoch);  // Atualiza o horário
    
    print("Novo Pokémon salvo: ID ${pokemon.id}, Horário ${DateTime.now().millisecondsSinceEpoch}");
    
    return pokemon;
  } else {
    // Caso contrário, retorna o Pokémon salvo
    if (idPrefs != null) {
      print("Pokémon encontrado no SharedPreferences com ID: $idPrefs");
      
      final pokemon = await _getPokemonFromApi(idPrefs);
      
      print("Pokémon retornado do SharedPreferences: ${pokemon.id} - ${pokemon.name}");
      
      return pokemon;
    }
    
    // Caso não tenha um Pokémon salvo ou não encontrou, gera um novo aleatório
    final randomId = Random().nextInt(809) + 1; // Gera um ID aleatório de 1 a 809
    final networkEntity = await apiClient.getPokemonById(randomId);  // Busca o Pokémon pela API
    final pokemon = networkMapper.toPokemon(networkEntity);
    
    // Limpa o ID anterior e salva o novo Pokémon e horário
    prefs.setInt('idPokemonRandom', pokemon.id);  // Salva o ID do novo Pokémon
    prefs.setInt('horario', DateTime.now().millisecondsSinceEpoch);  // Atualiza o horário
    
    print("Novo Pokémon salvo: ID ${pokemon.id}, Horário ${DateTime.now().millisecondsSinceEpoch}");
    
    return pokemon;
  }
}

// Função auxiliar para buscar o Pokémon a partir do ID
Future<Pokemon> _getPokemonFromApi(int id) async {
  final networkEntity = await apiClient.getPokemonById(id);
  final pokemon = networkMapper.toPokemon(networkEntity);
  return pokemon;
}


  @override
  Future<List<Pokemon>> getPokemons(
      // Paginação
      {required int page, required int limit}) async {
    // Tenta carregar a partir do banco de dados
    final dbEntities = await pokemonDao.selectAll(
        limit: limit, offset: (page * limit) - limit);

    // Se os dados já existem, carrega esses dados
    if (dbEntities.isNotEmpty) {
      return databaseMapper.toPokemons(dbEntities);
    }
    // Caso contrário, busca pela API remota
    final networkEntities =
        await apiClient.getPokemons(page: page, limit: limit);

    final pokemons = networkMapper.toPokemons(networkEntities);
    // E salva os dados no banco local para cache
    pokemonDao.insertAll(databaseMapper.toPokemonDatabaseEntities(pokemons));

    return pokemons;
  }
}
