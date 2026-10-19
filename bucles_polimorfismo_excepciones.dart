import 'dart:io';
import 'dart:math';

void main() {
  Circulo circulo = Circulo()..radio = 20;

  Figura figura = circulo;
  ExtraCalculations calculosExtra = circulo;

  print('El área es: ${figura.area()}');
  print('El perímetro es: ${figura.perimetro()}');
  print('El radio más diez es: ${calculosExtra.add10()}');

  print('\nPrimeros diez valores de Fibonacci:');
  int prev = 0;
  int next = 1;

  for (int i = 0; i < 10; i++) {
    print(prev);
    int sum = prev + next;
    prev = next;
    next = sum;
  }

  try {
    print('\nNúmero a dividir:');
    double number = double.parse(stdin.readLineSync()!);

    print('Divisor:');
    double divisor = double.parse(stdin.readLineSync()!);

    if (divisor == 0) {
      throw ArgumentError('No se puede dividir por cero.');
    }

    print('Resultado: ${number / divisor}');
  } on ArgumentError catch (error) {
    print(error.message);
  } on FormatException {
    print('Debe ingresar valores numéricos.');
  } catch (error) {
    print('Error desconocido: $error');
  }
}

abstract class ExtraCalculations {
  double add10();
}

abstract class Figura {
  double area();
  double perimetro();
}

class Circulo implements Figura, ExtraCalculations {
  double? radio;

  @override
  double area() => pi * radio! * radio!;

  @override
  double perimetro() => 2 * pi * radio!;

  @override
  double add10() => radio! + 10;
}
