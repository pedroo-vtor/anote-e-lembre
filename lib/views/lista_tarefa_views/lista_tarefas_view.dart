import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anote_e_lembre/models/tarefa_model.dart';
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

  Widget _buildListaTarefas(List<Tarefa> tarefas) {
    if (tarefas.isEmpty) {
      return const Center(child: Text("Nenhuma tarefa aqui."));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: tarefas.length,
      itemBuilder: (context, index) {
        final tarefa = tarefas[index];
        return Column(
          children: [
            TarefaView(tarefaAtual: tarefa),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar:
            ListaTarefaAppBar(),

        floatingActionButton: Builder(
          builder: (context) {
            final TabController controller = DefaultTabController.of(context);
            return AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return controller.index == 2
                    ? const ExcluirTodasTarefasView()
                    : const AdicionarTarefaView();
              },
            );
          },
        ),

        body: Consumer<TarefaViewModel>(
          builder: (context, tarefaViewModel, child) {
            final todasTarefas = tarefaViewModel.listaTarefas;

            final tarefasPendentes = todasTarefas
                .where((t) => t.tarefaFeita == false)
                .toList();

            final tarefasFeitas = todasTarefas
                .where((t) => t.tarefaFeita == true)
                .toList();

            return TabBarView(
              children: [

                // Aba 1: Todas
                _buildListaTarefas(todasTarefas),

                // Aba 2: Pendentes
                _buildListaTarefas(tarefasPendentes),

                // Aba 3: Feitas
                _buildListaTarefas(tarefasFeitas),
              ],
            );
          },
        ),
      ),
    );
  }
}
