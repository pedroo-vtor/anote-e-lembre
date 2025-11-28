import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anote_e_lembre/views_models/usuario_view_model.dart';
import 'package:anote_e_lembre/views_models/tarefa_view_model.dart';

class AdicionarTarefaView extends StatelessWidget {
  const AdicionarTarefaView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController tituloTarefaController = TextEditingController();
    TextEditingController descricaoTarefaController = TextEditingController();

    return Consumer<TarefaViewModel>(
      builder: (context, tarefaViewModel, child) {
        return FloatingActionButton(
          child: const Icon(Icons.add, color: Color(0xFF000000)),
          backgroundColor: const Color(0xFFFFD900),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  //Título do Alert Dialog
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

                      // Formulário título
                      TextField(
                        controller: tituloTarefaController,
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

                      // Espaçamento entre título e descrição
                      SizedBox(height: 20),

                      // Formulário Descrição
                      TextFormField(
                        controller: descricaoTarefaController,
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

                      // Espaçamento entre descrição e botões
                      SizedBox(height: 20),

                      //Botões de Ações
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          //Botão Cancelar
                          TextButton(
                            onPressed: () {
                              tituloTarefaController.clear();
                              descricaoTarefaController.clear();
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF999E9A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
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

                          // Espaçamento entre os botões de ações
                          SizedBox(width: 30),

                          //Botão Adicionar
                          Consumer<UsuarioViewModel>(
                            builder: (context, usuarioViewModel, child) {
                              return TextButton(
                                onPressed: () async {
                                  await tarefaViewModel.salvarTarefa(
                                    usuarioViewModel.usuario!.id!,
                                    tarefaViewModel.tituloTarefa =
                                        tituloTarefaController.text,
                                    tarefaViewModel.descricaoTarefa =
                                        descricaoTarefaController.text,
                                  );
                                  tituloTarefaController.clear();
                                  descricaoTarefaController.clear();
                                  Navigator.of(context).pop();
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFFFFD900),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
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
                              );
                            },
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
      },
    );
  }
}
