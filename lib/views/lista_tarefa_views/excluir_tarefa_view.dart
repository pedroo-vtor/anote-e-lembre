import 'package:flutter/material.dart';

class ExcluirTarefaView extends StatelessWidget {
  const ExcluirTarefaView({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),

      //Título do Alert Dialog (Excluir Tarefa)
      title: RichText(
        text: TextSpan(
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          children: [
            TextSpan(text: "Excluir "),
            TextSpan(
              text: "Título da Tarefa",
              style: TextStyle(color: Color(0xFFFF1800)),
            ),
            TextSpan(text: "?"),
          ],
        ),
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
  }
}
