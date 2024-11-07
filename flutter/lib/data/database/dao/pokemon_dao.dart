import 'dart:math';

import 'package:pokedex_app/data/database/dao/base_dao.dart';
import 'package:pokedex_app/data/database/entity/pokemon_database_entity.dart';
import 'package:sqflite/sqflite.dart';

class PokemonDao extends BaseDao {

  Future<PokemonDatabaseEntity?> selectById(int id) async {
  final Database db = await getDb();
  
  // Consulta para buscar o Pokémon pelo ID
  final List<Map<String, dynamic>> maps = await db.query(
    PokemonDatabaseContract.pokemonTable,
    where: '${PokemonDatabaseContract.idColumn} = ?',
    whereArgs: [id],
  );
  
  // Se encontrar o Pokémon, converte e retorna
  if (maps.isNotEmpty) {
    return PokemonDatabaseEntity.fromJson(maps.first);
  }
  
  // Se não encontrar, retorna null
  return null;
}

  Future<List<PokemonDatabaseEntity>> selectAll({
    int? limit,
    int? offset,
  }) async {
    // Espera pela resposta do banco
    final Database db = await getDb();
    // Consulta SQL na tabela pokemonTable ordenada pelo ID
    // que irá retorar uma lista de mapas
    final List<Map<String, dynamic>> maps = await db.query(
      PokemonDatabaseContract.pokemonTable,
      limit: limit,
      offset: offset,
      orderBy: '${PokemonDatabaseContract.idColumn} ASC',
    );
    // Responsavel pelo processamento dos resultados por meio do
    // PokemonDatabaseEntity.fromJson
    return List.generate(maps.length, (i) {
      return PokemonDatabaseEntity.fromJson(maps[i]);
    });
  }

  Future<void> insert(PokemonDatabaseEntity entity) async {
    final Database db = await getDb();
    await db.insert(PokemonDatabaseContract.pokemonTable, entity.toJson());
  }

  Future<void> insertRandomPokemon(PokemonDatabaseEntity entity) async {
    final Database db = await getDb();
    await db.insert(PokemonDatabaseContract.pokemonTable, entity.toJson());
  }

  Future<void> insertAll(List<PokemonDatabaseEntity> entities) async {
    final Database db = await getDb();
    await db.transaction((transaction) async {
      for (final entity in entities) {
        transaction.insert(
            PokemonDatabaseContract.pokemonTable, entity.toJson());
      }
    });
  }

  Future<void> deleteAll() async {
    final Database db = await getDb();
    await db.delete(PokemonDatabaseContract.pokemonTable);
  }

   Future<PokemonDatabaseEntity?> randomPokemon() async {
    final Database db = await getDb();
    
    // Gerar um ID aleatório entre 1 e 809
    final random = Random();
    final randomId = random.nextInt(809) + 1;  // Gera um número entre 1 e 809
    
    // Consulta para buscar o Pokémon pelo ID gerado
    final List<Map<String, dynamic>> maps = await db.query(
      PokemonDatabaseContract.pokemonTable,
      where: '${PokemonDatabaseContract.idColumn} = ?',
      whereArgs: [randomId],
    );

    if (maps.isNotEmpty) {
      return PokemonDatabaseEntity.fromJson(maps.first);
    }
    return null;
  }
}
