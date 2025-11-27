import 'package:flutter/material.dart';

class ExcluirTodasTarefasView extends StatelessWidget {
  const ExcluirTodasTarefasView({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.delete, color: Colors.white),
      backgroundColor: const Color(0xFFFF1800),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(20),
              ),

              //Título do Alert Dialog (Excluir Tarefa)
              title: const Text(
                "Tem certeza que deseja excluir todas as tarefas feitas?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              //Cor de Fundo
              backgroundColor: const Color(0xFFF7F2FA),

              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  //Botão Cancelar
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF999E9A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Cancelar",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 40),

                  //Botão Excluir
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFFF1800),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Excluir",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}