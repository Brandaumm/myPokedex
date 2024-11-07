
import 'package:dio/dio.dart';

import '../../../domain/exception/network_exception.dart';
import '../entity/http_paged_result.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient({required String baseUrl}) {
    _dio = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
  }

  // Método para buscar uma lista de Pokémons
  Future<List<PokemonEntity>> getPokemons({int? page, int? limit}) async {
    final response = await _dio.get(
      "/pokemons",
      queryParameters: {
        '_page': page,
        '_per_page': limit,
      },
    );

    if (response.statusCode != null && response.statusCode! >= 400) {
      throw NetworkException(
        statusCode: response.statusCode!,
        message: response.statusMessage,
      );
    } else if (response.statusCode != null) {
      final receivedData =
          HttpPagedResult.fromJson(response.data as Map<String, dynamic>);

      return receivedData.data; // Retorna diretamente a lista de PokemonEntity
    } else {
      throw Exception('Unknown error');
    }
  }

  // Método para buscar um Pokémon específico pelo id
  Future<PokemonEntity> getPokemonById(int id) async {
    final response = await _dio.get(
      "/pokemons/$id",  // Ajuste o endpoint para buscar um Pokémon específico
    );

    if (response.statusCode != null && response.statusCode! >= 400) {
      throw NetworkException(
        statusCode: response.statusCode!,
        message: response.statusMessage,
      );
    } else if (response.statusCode != null) {
      return PokemonEntity.fromJson(response.data); // Retorna o Pokémon específico
    } else {
      throw Exception('Unknown error');
    }
  }
}

