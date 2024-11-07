import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/pokemon.dart';
import 'type_widget.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    // Formata o ID do Pokémon para três dígitos
    String formattedId = pokemon.id.toString().padLeft(3, '0');
    // URL da imagem do Pokémon usando o ID formatado
    String imageUrl =
        'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$formattedId.png';

    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Center(
        child: SizedBox(
          width: 320,
          height: 130,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(232, 160, 155, 155), // Cor da borda amarela
                width: 4, // Espessura da borda
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Card(
              elevation: 10,
              color: pokemon.baseColor, // Cor do card baseada no tipo do Pokémon
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13), // Ajusta as bordas arredondadas para dentro
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Detalhes do Pokémon (nomes e tipos) à esquerda
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 18),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  pokemon.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 15),
                              // Tipos do Pokémon usando o TypeWidget
                              Wrap(
                                children: pokemon.type.map((type) {
                                  return TypeWidget(
                                    name: type,
                                  );
                                }).toList(),
                              ),
                              const SizedBox(height: 8),
                              // Atributos de base do Pokémon com Padding para afastar da borda esquerda
                              const Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16), // Espaçamento entre detalhes e imagem
                        // Imagem do Pokémon à direita
                        SizedBox(
                          width: 150,
                          height: 110,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
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
