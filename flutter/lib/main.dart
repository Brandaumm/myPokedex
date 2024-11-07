import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/pages/encontro_diario_page.dart';
import 'package:pokedex_app/ui/pages/home/home_page.dart';
import 'package:pokedex_app/ui/pages/my_pokemons_page.dart';
import 'package:pokedex_app/ui/pages/pokemons_list.dart';
import 'package:provider/provider.dart';

import 'core/di/configure_providers.dart';

Future<void> main() async {
  // Espera que todo mundo fique pronto para funções assincronas
  WidgetsFlutterBinding.ensureInitialized();

  // Cria toda a dependencia de providers e seus modelos
  final data = await ConfigureProviders.createDependencyTree();

  runApp(AppRoot(data: data));
}

class AppRoot extends StatelessWidget {
  final ConfigureProviders data;

  const AppRoot({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // MultiProvider é o responsavel pelo papel de garson para widgets
    // que necessitam de providers
     return MultiProvider(
      // Passa a lista de providers que podem ser usados por outros widgets
      providers: data.providers,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Layout inicial da aplicação, tambem responsavel pela transição
    // de telas 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pokedex",
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/pokedex': (context) => const PokemonListPage(),
        '/encontroDiario': (context) => const EncontroDiarioPage(),
        '/myPokemons': (context) => const MeusPokemonsPage(),

        // Adicione outras rotas como '/encontroDiario' e '/myPokemons'
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 4,
        ),
        textTheme: TextTheme(
          titleLarge: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.grey.shade200),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFF355DAA),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          ),
        ),
      ),
    );
  }
}
