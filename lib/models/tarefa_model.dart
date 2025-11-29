import 'package:cloud_firestore/cloud_firestore.dart';

class Tarefa {
  String id;
  String tituloTarefa;
  String descricaoTarefa;
  bool tarefaFeita;

  Tarefa({
    required this.id,
    required this.tituloTarefa,
    required this.descricaoTarefa,
    this.tarefaFeita = false
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

    List<Tarefa> listaTarefas = query.docs.map((doc) {
      final data = doc.data();
      return Tarefa(
        id: doc.id,
        tituloTarefa: data["tituloTarefa"] ?? "",
        descricaoTarefa: data["descricaoTarefa"] ?? "",
        tarefaFeita: data["feita"] ?? false, // Lê o status, se não existir, assume false
      );
    }).toList();

    return listaTarefas;
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
          "tituloTarefa": novoTituloTarefa,
          "descricaoTarefa": novaDescricaoTarefa,
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

  Future<void> atualizarStatus(
    String userId,
    String tarefaId,
    bool novoStatus,
  ) async {
    await FirebaseFirestore.instance
        .collection("usuarios")
        .doc(userId)
        .collection("tarefas")
        .doc(tarefaId)
        .update({
      "feita": novoStatus,
    });
  }

  
}
