void main() {
  Cuadrado cuadrado = Cuadrado();
  cuadrado.lado = 20;

  print('El área es: ${cuadrado.area}');
  print('El perímetro es: ${cuadrado.perimetro}');
  print('El lado es: ${cuadrado.lado}');
}

class Rectangulo {
  double? base;
  double? altura;

  double get area => base! * altura!;
  double get perimetro => 2 * base! + 2 * altura!;
}

class Cuadrado extends Rectangulo {
  set lado(double value) {
    base = value;
    altura = value;
  }

  double get lado => base!;
}
