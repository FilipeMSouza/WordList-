import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  print('Bem vido ao meu gerador de keywords');
  print('Insira uma informação sobre o seu alvo:');
  String? subjectInfo = stdin.readLineSync();

  print('Quantas Keywords você quer:');
  var number = stdin.readLineSync();
  int listLength = int.parse(number!);

  listGenerator(subjectInfo!, listLength);
}

void listGenerator(String str, int listLength) {
  var initial = str.substring(0, 3);
  var end = str.substring(str.length - 3, str.length);
  var rng = Random();

  List<int> randNumbers = [];
  List<String> keyWords = [];
  final filename = 'file.txt';

  for (var i = 0; i < listLength; i++) {
    randNumbers.add(rng.nextInt(100) * rng.nextInt(100));
    keyWords.add(initial + (randNumbers[i].toString()) + end);
  }

  print(keyWords);

  File file = File("KeyWords.txt");
  var sink = file.openWrite();

  for (var i = 0; i < listLength; i++) {
    sink.write('${keyWords[i]} \n');
  }
  sink.close();
}
