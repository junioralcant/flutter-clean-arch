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
  test('should return the first latter of the first and last names', () async {
    final player =
        NextEventPlayer(id: '', name: 'Junior Marques', isConfirmed: true);

    expect(player.getInitials(), 'JM');

    final player2 = NextEventPlayer(
      id: '',
      name: 'Pedro Murilo',
      isConfirmed: true,
    );

    expect(player2.getInitials(), 'PM');

    final player3 = NextEventPlayer(
      id: '',
      name: 'Brenda Rayane Marques',
      isConfirmed: true,
    );

    expect(player3.getInitials(), 'BM');
  });
}
