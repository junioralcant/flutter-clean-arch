import 'package:flutter_test/flutter_test.dart';
import 'package:teste_app_fluter/domain/entities/next_event_player.dart';

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

  test('should ignore extra white spaces', () {
    expect(initialsOf('junior marques '), 'JM');
    expect(initialsOf(' junior marques'), 'JM');
    expect(initialsOf('junior  marques'), 'JM');
    expect(initialsOf(' junior  marques '), 'JM');
    expect(initialsOf(' pedro'), 'PE');
    expect(initialsOf(' p '), 'P');
  });
}
