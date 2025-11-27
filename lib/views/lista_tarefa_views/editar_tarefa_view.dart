import 'package:flutter/material.dart';

class EditarTarefaView extends StatelessWidget {
  const EditarTarefaView({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),

      //Título do Alert Dialog (Adicionar Tarefa)
      title: const Text(
        "Editando Tarefa",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),

      //Cor de Fundo
      backgroundColor: const Color(0xFFF7F2FA),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Formulário para adicionar o título
          TextField(
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              hintText: "Tarefa...",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF838287), width: 1),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF838287), width: 1),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Formulário para adicionar a descrição
          TextFormField(
            maxLines: 6,
            minLines: 4,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Descrição...',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF838287)),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF838287)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 20),

          //Botões de ação
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Botão Cancelar
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
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

              const SizedBox(width: 30),

              //Botão Adicionar
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFFF9B00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(8),
                  ),
                ),
                child: const Text(
                  "Editar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
