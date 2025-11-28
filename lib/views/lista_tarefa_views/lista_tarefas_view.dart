import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anote_e_lembre/views_models/usuario_view_model.dart';
import 'package:anote_e_lembre/views_models/tarefa_view_model.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/appbar_view.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/tarefa_view.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/adicionar_tarefa_view.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/excluir_todas_tarefas_view.dart';

class ListaTarefasView extends StatefulWidget {
  const ListaTarefasView({super.key});

  @override
  State<ListaTarefasView> createState() => _ListaTarefasViewState();
}

class _ListaTarefasViewState extends State<ListaTarefasView> {
  @override
  void initState() {
    super.initState();
    // Carrega as tarefas ao iniciar a tela.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final usuarioViewModel = Provider.of<UsuarioViewModel>(
        context,
        listen: false,
      );
      final tarefaViewModel = Provider.of<TarefaViewModel>(
        context,
        listen: false,
      );

      if (usuarioViewModel.usuario?.id != null) {
        tarefaViewModel.carregarTarefa(usuarioViewModel.usuario!.id!);
      }
    });
  }

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
            Consumer<TarefaViewModel>(
              builder: (context, tarefaViewModel, child) {
                // Verifica se a lista está vazia
                if (tarefaViewModel.ListaTarefas.isEmpty) {
                  return const Center(
                    child: Text("Nenhuma tarefa encontrada."),
                  );
                }

                // Lista Vertical Todas as Tarefas
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: tarefaViewModel.ListaTarefas.length,
                  itemBuilder: (context, index) {
                    // Passa o índice para a TarefaView
                    return Column(
                      children: [
                        TarefaView(indexTarefa: index),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                );
              },
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
