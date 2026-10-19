import 'dart:io';

void main() {
  print('Ingrese el primer número:');
  double? a = double.tryParse(stdin.readLineSync() ?? '');

  print('Ingrese el segundo número:');
  double? b = double.tryParse(stdin.readLineSync() ?? '');

  const indeterminado = 'Indeterminado';

  if (a != null && b != null) {
    print('Suma: ${a + b}');
    print('Resta: ${a - b}');
    print('Multiplicación: ${a * b}');
    print('División: ${b != 0 ? a / b : indeterminado}');
  } else {
    print('Por favor, ingrese valores numéricos válidos.');
  }
}
