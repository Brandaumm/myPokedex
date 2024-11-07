import 'package:pokedex_app/data/database/dao/pokemon_dao.dart';
import 'package:pokedex_app/data/database/database_mapper.dart';
import 'package:pokedex_app/data/network/client/api_client.dart';
import 'package:pokedex_app/data/network/network_mapper.dart';
import 'package:pokedex_app/data/repository/pokemon_repository_impl.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ConfigureProviders {
  // O SingleChildWidget é utilizado para marcar widgets que podem
  // ser usados como provedores, garantindo que cada provider seja
  // compativel com o MultiProvider
  final List<SingleChildWidget> providers;

  ConfigureProviders({required this.providers});

  static Future<ConfigureProviders> createDependencyTree() async {
    // Cria objetos
    final apiClient = ApiClient(baseUrl: "http://192.168.1.4:3000");
    final networkMapper = NetworkMapper();
    final databaseMapper = DatabaseMapper();
    final pokemonDao = PokemonDao();

    final pokemonRepository = PokemonRepositoryImpl(
        apiClient: apiClient,
        networkMapper: networkMapper,
        databaseMapper: databaseMapper,
        pokemonDao: pokemonDao);

    // Transforma os objetos em providers para que toda a arvore de widget
    // possa consumir os providers necessários
    return ConfigureProviders(providers: [
      Provider<ApiClient>.value(value: apiClient),
      Provider<NetworkMapper>.value(value: networkMapper),
      Provider<DatabaseMapper>.value(value: databaseMapper),
      Provider<PokemonDao>.value(value: pokemonDao),
      Provider<PokemonRepositoryImpl>.value(value: pokemonRepository),
    ]);
  }
}
