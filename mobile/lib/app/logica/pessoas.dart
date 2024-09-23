class Pessoas {
  // Um Map que associa cada nome a uma função
  static Map<String, String> acolitos = {};

  // Adiciona uma pessoa e sua função associada
  static void adicionarPessoa(String nome, String funcao) {
    acolitos[nome] = funcao;
  }
}
