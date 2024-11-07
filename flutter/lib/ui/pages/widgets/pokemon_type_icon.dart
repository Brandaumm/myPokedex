// lib/ui/widgets/pokemon_type_icon.dart
import 'package:flutter/material.dart';

IconData getTypeIcon(String type) {
  switch (type) {
    case 'Fire':
      return Icons.local_fire_department;
    case 'Water':
      return Icons.water_drop;
    case 'Grass':
      return Icons.park;
    case 'Electric':
      return Icons.flash_on;
    case 'Ice':
      return Icons.ac_unit;
    case 'Fighting':
      return Icons.sports_martial_arts;
    case 'Poison':
      return Icons.bug_report;
    case 'Ground':
      return Icons.landscape;
    case 'Flying':
      return Icons.flight;
    case 'Psychic':
      return Icons.psychology;
    case 'Bug':
      return Icons.bug_report;
    case 'Rock':
      return Icons.terrain;
    case 'Ghost':
      return Icons.emoji_nature;
    case 'Dragon':
      return Icons.auto_fix_high;
    case 'Dark':
      return Icons.nights_stay;
    case 'Steel':
      return Icons.hardware;
    case 'Fairy':
      return Icons.auto_awesome;
    default:
      return Icons.help_outline;
  }
}
