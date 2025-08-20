import 'dart:io';

void main() {
  RandomAccessFile? arquivo;

  try {
    // Abrindo o arquivo para leitura (precisa fechar manualmente)
    arquivo = File('exemplo.txt').openSync();
    print('Arquivo aberto.');

    // Lendo conteúdo como bytes
    List<int> bytes = arquivo.readSync(arquivo.lengthSync());
    String conteudo = String.fromCharCodes(bytes);
    print('Conteúdo do arquivo: $conteudo');

    // Gerando um erro proposital para mostrar que finally ainda roda
    //throw Exception('Erro simulado!');

  } catch (e) {
    print('Ocorreu um erro: $e');

  } finally {
    // finally garante que o arquivo seja fechado
    if (arquivo != null) {
      arquivo.closeSync();
      print('Arquivo fechado no finally.');
    }
  }
}
