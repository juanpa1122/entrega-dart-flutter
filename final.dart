import 'dart:io';

import 'challenges/index.dart';
import 'menu/index.dart';

void main() {
  print('Ingrese su nombre:');
  String name = stdin.readLineSync()?.trim() ?? '';
  print('¡Hola, $name! Elige un ejercicio del menú.');

  Menu menu = Menu();

  while (true) {
    menu.MostrarMenu();
    String input = stdin.readLineSync()?.trim().toLowerCase() ?? '';

    if (input == 'q' || input == 'exit') {
      print('Programa finalizado.');
      break;
    }

    int? choice = int.tryParse(input);
    if (choice == null) {
      print("Opción no válida. Escriba un número, 'q' o 'exit'.");
      _pause();
      continue;
    }

    switch (choice) {
      case 1:
        Challenge1().run();
        break;
      case 2:
        Challenge2().run();
        break;
      case 3:
        Challenge3().run();
        break;
      case 4:
        Challenge4().run();
        break;
      case 5:
        Challenge5().run();
        break;
      case 6:
        Challenge6().run();
        break;
      case 7:
        Challenge7().run();
        break;
      case 8:
        Challenge8().run();
        break;
      case 9:
        Challenge9().run();
        break;
      case 10:
        Challenge10().run();
        break;
      case 11:
        Challenge11().run();
        break;
      case 12:
        Challenge12().run();
        break;
      case 13:
        Challenge13().run();
        break;
      case 14:
        Challenge14().run();
        break;
      case 15:
        Challenge15().run();
        break;
      default:
        print('Opción no válida. Ingrese un número entre 1 y 15.');
    }

    _pause();
  }
}

void _pause() {
  print('\nPresione Enter para volver al menú...');
  stdin.readLineSync();
}
