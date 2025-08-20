# Simulação de Abertura e Fechamento de Recurso em Dart

Este README explica passo a passo como funciona a simulação de abertura e fechamento de recurso usando Dart.

---

## Explicação linha por linha

* `import 'dart:io';`
  Importa a biblioteca para trabalhar com arquivos e entrada/saída.

* `void main() {`
  Ponto de entrada do programa.

* `RandomAccessFile? arquivo;`
  Declara uma variável que pode ser nula, representando o arquivo aberto.

* `try {`
  Início do bloco que pode gerar erros.

* `arquivo = File('exemplo.txt').openSync();`
  Abre o arquivo de forma síncrona, retorna `RandomAccessFile`.

* `print('Arquivo aberto.');`
  Confirma que o arquivo foi aberto.

* `List<int> bytes = arquivo.readSync(arquivo.lengthSync());`
  Lê todos os bytes do arquivo.

* `String conteudo = String.fromCharCodes(bytes);`
  Converte os bytes para string legível.

* `print('Conteúdo do arquivo: $conteudo');`
  Mostra o conteúdo no console.

* `throw Exception('Erro simulado!');`
  Gera um erro proposital para mostrar que `finally` será executado.

* `} catch (e) {`
  Captura qualquer erro ocorrido.

* `print('Ocorreu um erro: $e');`
  Exibe a mensagem do erro.

* `} finally {`
  Sempre executado, mesmo com erro.

* `if (arquivo != null) { arquivo.closeSync(); print('Arquivo fechado no finally.'); }`
  Fecha o arquivo e garante liberação do recurso.

---

## O que é RandomAccessFile

* Classe do Dart para trabalhar manualmente com arquivos.
* Permite:

  * Ler/escrever em qualquer posição.
  * Abrir e fechar explicitamente.
* Necessário para demonstrar `finally`, pois exige fechamento manual.

## Por que lemos todos os bytes

* `arquivo.readSync(n)` lê `n` bytes.
* `arquivo.lengthSync()` retorna o tamanho total do arquivo.
* Convertemos os bytes para string para visualizar o conteúdo.

---

## Resumo do fluxo do programa

1. Abre o arquivo com `RandomAccessFile`.
2. Lê o conteúdo como bytes e converte para string.
3. Gera um erro proposital (`throw`) para demonstrar captura de exceção.
4. `catch` exibe o erro.
5. `finally` garante fechamento do arquivo, mesmo com erro.

---

## Como Rodar o Programa

1. Abra o terminal.
2. e digite `DART carregandoRecurso.dart`
