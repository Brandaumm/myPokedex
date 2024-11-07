import 'package:flutter/material.dart';

Color getStatColor(int statValue) {
  if (statValue >= 130) {
    return const Color.fromARGB(255, 12, 63, 14)!;
  } else if (statValue >= 100) {
    return const Color.fromARGB(255, 157, 228, 160)!;
  } else if (statValue >= 60) {
    return const Color.fromARGB(255, 235, 233, 220);
  } else if (statValue >= 31) {
    return const Color.fromARGB(185, 224, 222, 219);
  } else {
    return const Color.fromARGB(255, 240, 238, 238);
  }
}
