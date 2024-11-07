import 'package:pokedex_app/domain/exception/mapper_exception.dart';
import 'package:pokedex_app/domain/pokemon.dart';
import 'package:pokedex_app/domain/base_stats.dart';
import 'package:pokedex_app/data/network/entity/http_paged_result.dart';

class NetworkMapper {
  // Converte uma entidade da rede (obtida da API) em um objeto Pokemon
  Pokemon toPokemon(PokemonEntity entity) {
    try {
      // Cria uma instância de BaseStats com valores padrão, caso algum atributo seja nulo
      final baseStats = BaseStats(
        hp: entity.base.hp ?? 0,
        attack: entity.base.attack ?? 0,
        defense: entity.base.defense ?? 0,
        spAttack: entity.base.spAttack ?? 0,
        spDefense: entity.base.spDefense ?? 0,
        speed: entity.base.speed ?? 0,
      );

      // Retorna uma instância de Pokemon com base nos dados da entidade e no BaseStats
      return Pokemon(
        id: int.parse(entity.id),
        name: entity.name.english ??
            'Unknown', // Usa "Unknown" se o nome em inglês for nulo
        type: entity.type ??
            [], // Garante que type seja uma lista vazia se for nulo
        base: baseStats,
      );
    } catch (e) {
      throw MapperException<PokemonEntity, Pokemon>(e.toString());
    }
  }

  // Converte uma lista de entidades da rede (obtidas da API) em uma lista de Pokemon
  List<Pokemon> toPokemons(List<PokemonEntity> entities) {
    return entities.map(toPokemon).toList();
  }
}
