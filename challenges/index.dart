import 'dart:io';
import 'dart:math';

String _readLine(String prompt) {
  print(prompt);
  return stdin.readLineSync()?.trim() ?? '';
}

double? _readDouble(String prompt) => double.tryParse(_readLine(prompt));
int? _readInt(String prompt) => int.tryParse(_readLine(prompt));

String _formatNumber(num value) {
  if (value == value.roundToDouble()) {
    return value.toInt().toString();
  }
  return value.toString();
}

class Challenge1 {
  void run() {
    double? number = _readDouble('Ingrese un número:');
    if (number == null) {
      print('Entrada no válida.');
    } else if (number > 0) {
      print('Resultado: ${_formatNumber(number * number)}');
    } else if (number < 0) {
      print('Resultado: Número negativo.');
    } else {
      print('Resultado: 0');
    }
  }
}

class Challenge2 {
  void run() {
    double? first = _readDouble('Ingrese el primer número:');
    double? second = _readDouble('Ingrese el segundo número:');

    if (first == null || second == null) {
      print('Debe ingresar dos números válidos.');
      return;
    }

    // El ejemplo 6, 6 devuelve 12; por eso la igualdad duplica el primero.
    double result = first >= second ? first * 2 : second * 3;
    print('Resultado: ${_formatNumber(result)}');
  }
}

class Challenge3 {
  void run() {
    double? number = _readDouble('Ingrese un número:');
    if (number == null) {
      print('Entrada no válida.');
      return;
    }

    double result = number > 0 ? sqrt(number) : number * number;
    print('Resultado: ${_formatNumber(result)}');
  }
}

class Challenge4 {
  void run() {
    double? radius = _readDouble('Ingrese el radio del círculo:');
    if (radius == null || radius < 0) {
      print('El radio debe ser un número mayor o igual que cero.');
      return;
    }

    double perimeter = 2 * pi * radius;
    print('Resultado: ${perimeter.toStringAsFixed(2)}');
  }
}

class Challenge5 {
  void run() {
    int? day = _readInt('Ingrese un número del 1 al 7:');

    switch (day) {
      case 1:
        print('Resultado: Lunes');
        break;
      case 2:
        print('Resultado: Martes');
        break;
      case 3:
        print('Resultado: Miércoles');
        break;
      case 4:
        print('Resultado: Jueves');
        break;
      case 5:
        print('Resultado: Viernes');
        break;
      default:
        print('Resultado: Número fuera del rango laboral.');
    }
  }
}

class Challenge6 {
  void run() {
    double? annualSalary = _readDouble('Ingrese su salario anual:');
    if (annualSalary == null || annualSalary < 0) {
      print('El salario no es válido.');
      return;
    }

    if (annualSalary > 12000) {
      double tax = (annualSalary - 12000) * 0.15;
      print('Resultado: ${_formatNumber(tax)}');
    } else {
      print('Resultado: No debe impuestos.');
    }
  }
}

class Challenge7 {
  void run() {
    int? first = _readInt('Ingrese el primer número:');
    int? second = _readInt('Ingrese el segundo número:');

    if (first == null || second == null) {
      print('Debe ingresar dos números enteros válidos.');
      return;
    }
    if (second == 0) {
      print('No se puede dividir entre cero.');
      return;
    }

    print('Resultado: ${first % second}');
  }
}

class Challenge8 {
  void run() {
    int sum = 0;
    for (int number = 2; number <= 50; number += 2) {
      sum += number;
    }

    print('Resultado: $sum');
  }
}

class Challenge9 {
  void run() {
    int? numerator1 = _readInt('Numerador de la primera fracción:');
    int? denominator1 = _readInt('Denominador de la primera fracción:');
    int? numerator2 = _readInt('Numerador de la segunda fracción:');
    int? denominator2 = _readInt('Denominador de la segunda fracción:');

    if ([numerator1, denominator1, numerator2, denominator2]
        .any((value) => value == null)) {
      print('Todos los valores deben ser enteros.');
      return;
    }

    try {
      Fraccion first = Fraccion(numerator1!, denominator1!);
      Fraccion second = Fraccion(numerator2!, denominator2!);
      Fraccion result = first.restar(second);
      print('Resultado: $result');
    } on ArgumentError catch (error) {
      print('Error: ${error.message}');
    }
  }
}

class Fraccion {
  final int numerador;
  final int denominador;

  factory Fraccion(int numerador, int denominador) {
    if (denominador == 0) {
      throw ArgumentError('El denominador no puede ser cero.');
    }

    int sign = denominador < 0 ? -1 : 1;
    int normalizedNumerator = numerador * sign;
    int normalizedDenominator = denominador.abs();
    int commonDivisor = _greatestCommonDivisor(
      normalizedNumerator.abs(),
      normalizedDenominator,
    );

    return Fraccion._(
      normalizedNumerator ~/ commonDivisor,
      normalizedDenominator ~/ commonDivisor,
    );
  }

  const Fraccion._(this.numerador, this.denominador);

  Fraccion restar(Fraccion otra) {
    int newNumerator =
        numerador * otra.denominador - otra.numerador * denominador;
    int newDenominator = denominador * otra.denominador;
    return Fraccion(newNumerator, newDenominator);
  }

  static int _greatestCommonDivisor(int a, int b) {
    while (b != 0) {
      int remainder = a % b;
      a = b;
      b = remainder;
    }
    return a == 0 ? 1 : a;
  }

  @override
  String toString() => numerador == 0 ? '0' : '$numerador/$denominador';
}

class Challenge10 {
  void run() {
    String word = _readLine('Ingrese una palabra:');
    print('Resultado: ${word.length}');
  }
}

class Challenge11 {
  void run() {
    List<double?> values = [
      _readDouble('Ingrese el primer número:'),
      _readDouble('Ingrese el segundo número:'),
      _readDouble('Ingrese el tercer número:'),
      _readDouble('Ingrese el cuarto número:'),
    ];

    if (values.any((value) => value == null)) {
      print('Debe ingresar cuatro números válidos.');
      return;
    }

    double total = values.fold(0.0, (sum, value) => sum + value!);
    double average = total / values.length;
    print('Resultado: ${_formatNumber(average)}');
  }
}

class Challenge12 {
  void run() {
    List<double> values = [];
    for (int index = 1; index <= 5; index++) {
      double? value = _readDouble('Ingrese el número $index:');
      if (value == null) {
        print('Entrada no válida.');
        return;
      }
      values.add(value);
    }

    double smallest = values.reduce(min);
    print('Resultado: ${_formatNumber(smallest)}');
  }
}

class Challenge13 {
  void run() {
    String word = _readLine('Ingrese una palabra:').toLowerCase();
    const String vowels = 'aeiouáéíóúü';
    int count = word.split('').where(vowels.contains).length;
    print('Resultado: $count');
  }
}

class Challenge14 {
  void run() {
    int? number = _readInt('Ingrese un número entero no negativo:');
    if (number == null || number < 0) {
      print('Debe ingresar un número entero no negativo.');
      return;
    }

    int factorial = 1;
    for (int factor = 2; factor <= number; factor++) {
      factorial *= factor;
    }

    print('Resultado: $factorial');
  }
}

class Challenge15 {
  void run() {
    double? number = _readDouble('Ingrese un número:');
    if (number == null) {
      print('Entrada no válida.');
      return;
    }

    if (number >= 10 && number <= 20) {
      print('Resultado: Está en el rango.');
    } else {
      print('Resultado: Fuera del rango.');
    }
  }
}
