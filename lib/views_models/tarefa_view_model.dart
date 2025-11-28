import 'package:anote_e_lembre/models/tarefa_model.dart';
import 'package:flutter/material.dart';

class TarefaViewModel extends ChangeNotifier {
  String? _tituloTarefa;
  String? _descricaoTarefa;

  String? get tituloTarefa => _tituloTarefa;
  String? get descricaoTarefa => _descricaoTarefa;

  List<Tarefa> ListaTarefas = [];

  Tarefa? tarefa;

  set tituloTarefa(String tituloTarefa) {
    _tituloTarefa = tituloTarefa;
    notifyListeners();
  }

  set descricaoTarefa(String descricaoTarefa) {
    _descricaoTarefa = descricaoTarefa;
    notifyListeners();
  }

  Future<bool> salvarTarefa(
    String uid,
    String tituloTarefa,
    String descricaoTarefa,
  ) async {
    tarefa = Tarefa(
      id: "",
      tituloTarefa: tituloTarefa,
      descricaoTarefa: descricaoTarefa,
    );
    tarefa?.adicionarTarefa(uid);
    await carregarTarefa(uid);
    notifyListeners();
    return true;
  }

  Future<void> carregarTarefa(String uid) async {
    tarefa = Tarefa(id: uid, tituloTarefa: "", descricaoTarefa: "");
    print('USUÁRIO ID NO VIEW MODEL: $uid');
    ListaTarefas = await tarefa!.lerTarefas(uid);

    print(ListaTarefas);

    notifyListeners();
  }

  Future<void> atualizarTarefa(
    String uid,
    String tarefaId,
    String novoTituloTarefa,
    String novaDescricaoTarefa,
  ) async {
    tarefa = Tarefa(id: uid, tituloTarefa: "", descricaoTarefa: "");
    await tarefa!.atualizarTarefa(
      uid,
      tarefaId,
      novoTituloTarefa,
      novaDescricaoTarefa,
    );
    notifyListeners();
  }

  Future<void> deletarTarefa(String uid, String tarefaId) async {
    tarefa = Tarefa(id: uid, tituloTarefa: "", descricaoTarefa: "");
    await tarefa!.deletarTarefa(uid, tarefaId);
    notifyListeners();
  }
}
