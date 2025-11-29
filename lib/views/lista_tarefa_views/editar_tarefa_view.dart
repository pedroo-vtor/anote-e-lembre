import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anote_e_lembre/views_models/tarefa_view_model.dart';
import 'package:anote_e_lembre/views_models/usuario_view_model.dart';

class EditarTarefaView extends StatefulWidget {
  final String tarefaId;
  final String? tituloTarefaAtual;
  final String? descricaoTarefaAtual;

  const EditarTarefaView({
    super.key,
    required this.tarefaId,
    required this.tituloTarefaAtual,
    required this.descricaoTarefaAtual,
  });

  @override
  State<EditarTarefaView> createState() => _EditarTarefaViewState();
}

class _EditarTarefaViewState extends State<EditarTarefaView> {
  late TextEditingController _tituloTarefaController;
  late TextEditingController _descricaoTarefaController;

  @override
  void initState() {
    super.initState();
    _tituloTarefaController = TextEditingController(
      text: widget.tituloTarefaAtual ?? '',
    );
    _descricaoTarefaController = TextEditingController(
      text: widget.descricaoTarefaAtual ?? '',
    );
  }

  @override
  void dispose() {
    _tituloTarefaController.dispose();
    _descricaoTarefaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TarefaViewModel>(
      builder: (context, tarefaViewModel, child) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: const Text(
            "Editando Tarefa",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),

          backgroundColor: const Color(0xFFF7F2FA),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _tituloTarefaController,
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

              TextFormField(
                controller: _descricaoTarefaController,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF999E9A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 30),

                  Consumer<UsuarioViewModel>(
                    builder: (context, usuarioViewModel, child) {
                      final usuarioId = usuarioViewModel.usuario?.id ?? '';

                      return TextButton(
                        onPressed: () {
                          tarefaViewModel.atualizarTarefa(
                            usuarioId,
                            widget.tarefaId,
                            _tituloTarefaController.text,
                            _descricaoTarefaController.text,
                          );
                          tarefaViewModel.carregarTarefa(usuarioId);
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFFF9B00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Editar",
                          style: TextStyle(
                            color: Colors.black,
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
  }
}
