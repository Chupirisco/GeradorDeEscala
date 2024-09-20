class Pessoas {
  static List<String> nomes = [];

  static void adicionarPessoasaLista(value) {
    nomes.add(value);
  }

  static String nomesEmSequencia() {
    String nomeSequencia = '';
    for (var element in Pessoas.nomes) {
      nomeSequencia += ' $element';
    }
    return nomeSequencia;
  }
}
