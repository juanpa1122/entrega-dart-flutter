import 'dart:io';

void main() {
  print('¡Hola! Bienvenido al calculador de años.');
  print('Escribe tu nombre:');
  String? nameInput = stdin.readLineSync();

  print('Un gusto conocerte $nameInput');
  print('Escribe tu fecha de nacimiento en formato dd/mm/yyyy:');
  String? birthdayInput = stdin.readLineSync();

  DateTime? dateConverted = convertToDate(birthdayInput);
  if (dateConverted == null) {
    print('La fecha de nacimiento es inválida: $birthdayInput');
    return;
  }

  var person = Person(
    name: nameInput,
    birthday: dateConverted,
    age: DateTime.now().year - dateConverted.year,
  );

  print('Tu nombre: ${person.name}');
  print('Tu fecha de nacimiento: ${person.birthday}');
  print('Tu edad aproximada es: ${person.age} años');
}

DateTime? convertToDate(String? date) {
  if (date == null) return null;

  List<String> parts = date.split('/');
  if (parts.length != 3) return null;

  return DateTime.tryParse('${parts[2]}-${parts[1]}-${parts[0]}');
}

class Person {
  final String? name;
  final DateTime birthday;
  final int age;

  Person({required this.name, required this.birthday, required this.age});
}
