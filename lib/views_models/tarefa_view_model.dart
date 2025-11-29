import 'package:anote_e_lembre/models/tarefa_model.dart';
import 'package:flutter/material.dart';

class TarefaViewModel extends ChangeNotifier {
  String? _tituloTarefa;
  String? _descricaoTarefa;

  String? get tituloTarefa => _tituloTarefa;
  String? get descricaoTarefa => _descricaoTarefa;

  List<Tarefa> listaTarefas = [];

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
      tarefaFeita: false,
    );
    tarefa?.adicionarTarefa(uid);
    await carregarTarefa(uid);
    notifyListeners();
    return true;
  }

  Future<void> carregarTarefa(String uid) async {
    Tarefa tarefaAuxiliar = Tarefa(id: "", tituloTarefa: "", descricaoTarefa: "");
    print('USUÁRIO ID NO VIEW MODEL: $uid');
    
    listaTarefas = await tarefaAuxiliar.lerTarefas(uid);

    print("Tarefas carregadas: ${listaTarefas.length}");
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

  Future<void> alternarStatusTarefa(String uid, Tarefa tarefaAlvo, bool novoStatus) async {
    final index = listaTarefas.indexWhere((t) => t.id == tarefaAlvo.id);
    if (index != -1) {
      listaTarefas[index].tarefaFeita = novoStatus;
      notifyListeners();
    }

    Tarefa tarefaAuxiliar = Tarefa(id: "", tituloTarefa: "", descricaoTarefa: "");
    await tarefaAuxiliar.atualizarStatus(uid, tarefaAlvo.id, novoStatus);
    
  }
}
