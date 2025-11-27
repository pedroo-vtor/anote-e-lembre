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

        // Lógica de para alterar de de floatingActionButton
        floatingActionButton: Builder(
          builder: (context) {
            final TabController controller = DefaultTabController.of(context);
            return AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                // Se o index for 2, retorna o botão de excluir,
                // Caso contrário (0 ou 1), retorna o botão de adicionar
                return controller.index == 2
                    ? const ExcluirTodasTarefasView()
                    : const AdicionarTarefaView();
              },
            );
          },
        ),

        body: TabBarView(
          children: [
            // Aba 1: Todas as Tarefas
            ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                TarefaView(),
                SizedBox(height: 10),
                TarefaView(),
                SizedBox(height: 10),
                TarefaView(),
              ],
            ),

            // Aba 2: Pendentes
            const Center(
              child: Text(
                "Tarefas Pendentes",
                style: TextStyle(color: Color(0xFF000000)),
              ),
            ),

            // Aba 3: Feitas
            const Center(
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
