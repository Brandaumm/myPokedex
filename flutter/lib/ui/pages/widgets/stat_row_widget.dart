// stat_rows_widget.dart
import 'package:flutter/material.dart';

class StatRowWidget extends StatelessWidget {
  final String statName;
  final int statValue;
  final Color Function(int) getStatColor;

  const StatRowWidget({
    super.key,
    required this.statName,
    required this.statValue,
    required this.getStatColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              statName,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            statValue.toString(),
            style: TextStyle(color: Colors.grey[800]),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 150,
            child: LinearProgressIndicator(
              value: statValue / 255,
              backgroundColor: Colors.grey[300],
              color: getStatColor(statValue),
              minHeight: 6,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}

class TotalStatRowWidget extends StatelessWidget {
  final String statName;
  final int totalValue;

  const TotalStatRowWidget({
    super.key,
    required this.statName,
    required this.totalValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              statName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child:
                Container(), // Espaço vazio para não mostrar barra de progresso
          ),
          const SizedBox(width: 8),
          Text(
            totalValue.toString(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
