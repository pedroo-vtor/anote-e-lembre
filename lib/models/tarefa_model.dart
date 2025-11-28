import 'package:cloud_firestore/cloud_firestore.dart';

class Tarefa {
  String id;
  String tituloTarefa;
  String descricaoTarefa;

  Tarefa({
    required this.id,
    required this.tituloTarefa,
    required this.descricaoTarefa,
  });

  // Adicionar Tarefa.
  void adicionarTarefa(final userId) {
    FirebaseFirestore.instance
        .collection("usuarios")
        .doc(userId)
        .collection("tarefas")
        .add({
          "tituloTarefa": tituloTarefa,
          "descricaoTarefa": descricaoTarefa,
        });
  }

  // Ler Tarefas
  Future<List<Tarefa>> lerTarefas(String userId) async {
    final query = await FirebaseFirestore.instance
        .collection("usuarios")
        .doc(userId)
        .collection("tarefas")
        .get();

    List<Tarefa> ListaTarefas = query.docs.map((doc) {
      return Tarefa(
        id: doc.id,
        tituloTarefa: doc["tituloTarefa"],
        descricaoTarefa: doc["descricaoTarefa"],
      );
    }).toList();

    return ListaTarefas;
  }

  // Atualizar Tarefa
  Future<void> atualizarTarefa(
    String userId,
    String tarefaId,
    String novoTituloTarefa,
    String novaDescricaoTarefa,
  ) async {
    await FirebaseFirestore.instance
        .collection("usuarios")
        .doc(userId)
        .collection("tarefas")
        .doc(tarefaId)
        .update({
          "tituloTarefa": tituloTarefa,
          "descricaoTarefa": descricaoTarefa,
        });
  }

  // Deletar Tarefa
  Future<void> deletarTarefa(String userId, String tarefaId) async {
    await FirebaseFirestore.instance
        .collection("usuarios")
        .doc(userId)
        .collection("tarefas")
        .doc(tarefaId)
        .delete();
  }
}
