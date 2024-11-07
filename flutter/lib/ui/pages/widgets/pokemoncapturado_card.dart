import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/ui/pages/pokemoncapturado.dart';
import '../../../domain/pokemon.dart'; // Importa o modelo de Pokémon

class PokemoncapturadoCard extends StatelessWidget {
  final Pokemon pokemon;
  final Future<void> Function(int pokemonId) onRemove; // Adicionando o parâmetro para a função de remoção

  const PokemoncapturadoCard({
    super.key, 
    required this.pokemon, 
    required this.onRemove, // Passando a função de remoção
  });

  @override
  Widget build(BuildContext context) {
    // Formata o ID do Pokémon para três dígitos
    String formattedId = pokemon.id.toString().padLeft(3, '0');
    // URL da imagem do Pokémon usando o ID formatado
    String imageUrl =
        'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$formattedId.png';

    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0), // Ajusta o padding para diminuir a distância entre os cards
      child: GestureDetector(
        onTap: () {
          // Ao clicar no card, navega para a página de detalhes, passando a função onRemove
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonCapturadoDetailPage(
                pokemon: pokemon,
                onRemove: onRemove, // Passando a função de remoção
              ),
            ),
          );
        },
        child: Center(
          child: SizedBox(
            width: 150, // Tamanho fixo para o card
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Bordas arredondadas
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Faz com que a coluna ocupe apenas o espaço necessário
                children: [
                  // Imagem do Pokémon
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16), // Bordas arredondadas para a imagem
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.contain, // Ajusta a imagem mantendo sua proporção
                      width: double.infinity, // A imagem ocupa toda a largura disponível
                      height: 100, // Limita a altura da imagem
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Nome do Pokémon
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    child: Text(
                      pokemon.name, // Exibe o nome do Pokémon
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 14, // Tamanho da fonte menor
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

