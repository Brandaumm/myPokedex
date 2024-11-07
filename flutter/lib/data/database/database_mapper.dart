import 'package:pokedex_app/data/database/entity/pokemon_database_entity.dart';
import 'package:pokedex_app/domain/exception/mapper_exception.dart';
import 'package:pokedex_app/domain/pokemon.dart';
import 'package:pokedex_app/domain/base_stats.dart';

class DatabaseMapper {
  // Converte uma PokemonDatabaseEntity em um objeto Pokemon
  Pokemon toPokemon(PokemonDatabaseEntity entity) {
    try {
      final baseStats = BaseStats(
        hp: int.parse(entity.hp.toString()),
        attack: int.parse(entity.attack.toString()),
        defense: int.parse(entity.defense.toString()),
        spAttack: int.parse(entity.spAttack.toString()),
        spDefense: int.parse(entity.spDefense.toString()),
        speed: int.parse(entity.speed.toString()),
      );

      final types = [
        entity.type1,
        if (entity.type2 != null) entity.type2!,
      ];

      return Pokemon(
        id: entity.id,
        name: entity.name,
        type: types,
        base: baseStats,
      );
    } catch (e) {
      throw MapperException<PokemonDatabaseEntity, Pokemon>(e.toString());
    }
  }

  // Converte uma lista de PokemonDatabaseEntity em uma lista de Pokemon
  List<Pokemon> toPokemons(List<PokemonDatabaseEntity> entities) {
    return entities.map(toPokemon).toList();
  }

  // Converte um objeto Pokemon em uma PokemonDatabaseEntity
  PokemonDatabaseEntity toPokemonDatabaseEntity(Pokemon pokemon) {
    try {
      return PokemonDatabaseEntity(
        id: pokemon.id,
        name: pokemon.name,
        type1: pokemon.type[0],
        type2: pokemon.type.length > 1
            ? pokemon.type[1]
            : null, // Pega o segundo tipo se existir
        hp: pokemon.base.hp,
        attack: pokemon.base.attack,
        defense: pokemon.base.defense,
        spAttack: pokemon.base.spAttack,
        spDefense: pokemon.base.spDefense,
        speed: pokemon.base.speed,
      );
    } catch (e) {
      throw MapperException<Pokemon, PokemonDatabaseEntity>(e.toString());
    }
  }

  // Converte uma lista de Pokemon em uma lista de PokemonDatabaseEntity
  List<PokemonDatabaseEntity> toPokemonDatabaseEntities(
      List<Pokemon> pokemons) {
    return pokemons.map(toPokemonDatabaseEntity).toList();
  }
}
