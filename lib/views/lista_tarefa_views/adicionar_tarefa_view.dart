import 'package:flutter/material.dart';

class AdicionarTarefaView extends StatelessWidget {
  const AdicionarTarefaView({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add, color: Color(0xFF000000)),
      backgroundColor: const Color(0xFFFFD900),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(20),
              ),

              //Título do Alert Dialog (Adicionar Tarefa)
              title: const Text(
                "Adicionar Tarefa",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              //Cor de Fundo
              backgroundColor: Color(0xFFF7F2FA),

              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Formulário para adicionar o título
                  TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: "Tarefa...",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF838287),
                          width: 1,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF838287),
                          width: 1,
                        ),
                      ),
                    ),
                  ),

                  //Espaço entre Título e Descrição
                  SizedBox(height: 20),

                  // Formulário para adicionar a descrição
                  TextFormField(
                    maxLines: 6,
                    minLines: 4,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Descrição...',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF838287)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF838287)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  //Espaçamento entre Descrição e os botões
                  SizedBox(height: 20),

                  //Botões de Ações
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Botão Cancelar
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF999E9A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(8),
                          ),
                        ),
                        child: Text(
                          "Cancelar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //Espaçamento entre os botões
                      SizedBox(width: 30),

                      //Botão Adicionar
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFFFD900),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(8),
                          ),
                        ),
                        child: Text(
                          "Adicionar",
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
          },
        );
      },
    );
  }
}
