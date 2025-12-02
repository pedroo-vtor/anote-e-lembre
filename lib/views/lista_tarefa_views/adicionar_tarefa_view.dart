import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anote_e_lembre/views_models/usuario_view_model.dart';
import 'package:anote_e_lembre/views_models/tarefa_view_model.dart';

class AdicionarTarefaView extends StatelessWidget {
  const AdicionarTarefaView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController tituloTarefaController =
        TextEditingController();
    final TextEditingController descricaoTarefaController =
        TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  title: const Text(
                    "Adicionar Tarefa",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  backgroundColor: const Color(0xFFF7F2FA),

                  content: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: tituloTarefaController,
                          cursorColor: Colors.black,
                          maxLength: 60,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'O título é obrigatório';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Tarefa...",
                            counterText:
                                "",
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

                        const SizedBox(height: 20),

                        TextFormField(
                          controller: descricaoTarefaController,
                          maxLines: 4,
                          minLines: 2,
                          maxLength: 300,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: 'Descrição (opcional)...',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF838287),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF838287),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Botões
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                tituloTarefaController.clear();
                                descricaoTarefaController.clear();
                                Navigator.of(context).pop();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF999E9A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                "Cancelar",
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 30),

                            Consumer<UsuarioViewModel>(
                              builder: (context, usuarioViewModel, child) {
                                return TextButton(
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      await tarefaViewModel.salvarTarefa(
                                        usuarioViewModel.usuario!.id!,
                                        tituloTarefaController.text,
                                        descricaoTarefaController.text,
                                      );
                                      tituloTarefaController.clear();
                                      descricaoTarefaController.clear();
                                      if (context.mounted)
                                        Navigator.of(context).pop();
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFFFFD900),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    "Adicionar",
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
