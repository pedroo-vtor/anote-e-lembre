import 'package:anote_e_lembre/views_models/usuario_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/appbar_view.dart';

class ListaTarefasView extends StatelessWidget {
  const ListaTarefasView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: ListaTarefaAppBar(),
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                "Todas As Tarefas",
                style: TextStyle(color: Color(0xFF000000)),
              ),
            ),
            Center(
              child: Text(
                "Tarefas Pedentes",
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
