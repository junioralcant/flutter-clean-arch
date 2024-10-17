import 'package:flutter_test/flutter_test.dart';

class NextEventPlayer {
  final String id;
  final String name;
  final String? photo;
  final String? position;
  final bool isConfirmed;
  final DateTime? confirmationDate;

  NextEventPlayer(
      {required this.id,
      required this.name,
      required this.isConfirmed,
      this.photo,
      this.position,
      this.confirmationDate});

  String getInitials() {
    final names = name.split(' ');
    final firstChar = names.first[0];
    final lastChar = names.last[0];

    return '$firstChar$lastChar';
  }
}

void main() {
  NextEventPlayer makeSut(String name) =>
      NextEventPlayer(id: '', name: name, isConfirmed: true);

  test('should return the first latter of the first and last names', () async {
    expect(makeSut('Junior Marques').getInitials(), 'JM');
    expect(makeSut('Pedro Murilo').getInitials(), 'PM');
    expect(makeSut('Brenda Rayane de Marques').getInitials(), 'BM');
  });
}
