import 'package:flutter_test/flutter_test.dart';

class NextEventPlayer {
  final String id;
  final String name;
  final String initials;
  final String? photo;
  final String? position;
  final bool isConfirmed;
  final DateTime? confirmationDate;

  NextEventPlayer._(
      {required this.id,
      required this.name,
      required this.isConfirmed,
      required this.initials,
      this.photo,
      this.position,
      this.confirmationDate});

  factory NextEventPlayer({
    required String id,
    required String name,
    required bool isConfirmed,
    String? photo,
    String? position,
    DateTime? confirmationDate,
  }) =>
      NextEventPlayer._(
          id: id,
          name: name,
          isConfirmed: isConfirmed,
          initials: _getInitials(name),
          confirmationDate: confirmationDate,
          photo: photo,
          position: photo);

  static String _getInitials(String name) {
    final names = name.toUpperCase().split(' ');
    final firstChar = names.first.split('').firstOrNull ?? '-';
    final lastChar =
        names.last.split('').elementAtOrNull(names.length == 1 ? 1 : 0) ?? '';

    return '$firstChar$lastChar';
  }
}

void main() {
  String initialsOf(String name) =>
      NextEventPlayer(id: '', name: name, isConfirmed: true).initials;

  test('should return the first latter of the first and last names', () async {
    expect(initialsOf('Junior Marques'), 'JM');
    expect(initialsOf('Pedro Murilo'), 'PM');
    expect(initialsOf('Brenda Rayane de Marques'), 'BM');
  });

  test('should return the first letters of the first name', () {
    expect(initialsOf('Junior'), 'JU');
    expect(initialsOf('J'), 'J');
  });

  test('should return "-" when name is empty', () {
    expect(initialsOf(''), '-');
  });

  test('should convert to uppercase', () {
    expect(initialsOf('junior marques'), 'JM');
    expect(initialsOf('pedro'), 'PE');
    expect(initialsOf('p'), 'P');
  });
}
