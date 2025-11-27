import 'package:flutter/material.dart';

class ExcluirTodasTarefasView extends StatelessWidget {
  const ExcluirTodasTarefasView({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.delete, color: Color.fromARGB(255, 255, 255, 255)),
      backgroundColor: const Color.fromARGB(255, 255, 0, 0),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Excluir Todas as Tarefas Feitas"),
            );
          },
        );
      },
    );
  }
}
