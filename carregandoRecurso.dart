import 'dart:io';

void main() {
  RandomAccessFile? arquivo;

  try {
    arquivo = File('exemplo.txt').openSync();
    print('Arquivo aberto.');

    List<int> bytes = arquivo.readSync(arquivo.lengthSync());
    String conteudo = String.fromCharCodes(bytes);
    print('Conteúdo do arquivo: \n$conteudo');

  } catch (e) {
    print('Ocorreu um erro: $e');

  } finally {
    if (arquivo != null) {
      arquivo.closeSync();
      print('Arquivo fechado no finally.');
    }else print('Finally executou!');
  }
}
