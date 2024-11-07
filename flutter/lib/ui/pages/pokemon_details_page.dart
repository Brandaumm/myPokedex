import 'package:flutter/material.dart';
import '../../domain/pokemon.dart';

class PokemonDetailsPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailsPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String formattedId = pokemon.id.toString().padLeft(3, '0');
    String imageUrl =
        'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$formattedId.png';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: pokemon.baseColor,
        title: Text(
          '${pokemon.name} #$formattedId',
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Imagem do Pokémon
            Center(
              child: Image.network(
                imageUrl,
                width: 150,
                height: 150,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image_not_supported, size: 80),
              ),
            ),
            const SizedBox(height: 16),

            // Tipo do Pokémon
            Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children: pokemon.type.map((type) {
                return Chip(
                  label: Text(
                    type,
                    style: const TextStyle(color: Colors.black),
                  ),
                  backgroundColor: pokemon.baseColor?.withOpacity(0.2),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),

            // Atributos de base simplificados
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Base Stats",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                _buildStatRow("HP", pokemon.base.hp),
                _buildStatRow("Attack", pokemon.base.attack),
                _buildStatRow("Defense", pokemon.base.defense),
                _buildStatRow("Speed", pokemon.base.speed),
                _buildStatRow("Sp. Atk", pokemon.base.spAttack),
                _buildStatRow("Sp. Def", pokemon.base.spDefense),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String statName, int statValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            statName,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          Text(
            statValue.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
