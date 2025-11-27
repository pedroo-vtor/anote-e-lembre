import 'package:flutter/material.dart';
import 'package:anote_e_lembre/views_models/usuario_view_model.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/appbar_view.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/tarefa_view.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/adicionar_tarefa_view.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/excluir_todas_tarefas_view.dart';

class ListaTarefasView extends StatelessWidget {
  const ListaTarefasView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // Appbar
        appBar: ListaTarefaAppBar(),
        floatingActionButton: AdicionarTarefaView(),

        body: TabBarView(
          children: [
            // Aba 1: Todas as Tarefas
            ListView(
              padding: const EdgeInsets.all(16),

              children: [
                TarefaView(),
                SizedBox(height: 10), // Espaço entre os cards
                TarefaView(),
                SizedBox(height: 10),
                TarefaView(),
              ],
            ),
            Center(
              child: Text(
                "Tarefas Pendentes",
                style: TextStyle(color: Color(0xFF000000)),
              ),
            ),
            Center(
              child: Text(
                "Tarefas Feitas",
                style: TextStyle(color: Color(0xFF000000)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
