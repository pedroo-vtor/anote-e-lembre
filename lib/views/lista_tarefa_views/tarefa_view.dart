import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anote_e_lembre/models/tarefa_model.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/editar_tarefa_view.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/excluir_tarefa_view.dart';
import 'package:anote_e_lembre/views_models/tarefa_view_model.dart';
import 'package:anote_e_lembre/views_models/usuario_view_model.dart';

class TarefaView extends StatefulWidget {
  final Tarefa tarefaAtual;

  const TarefaView({super.key, required this.tarefaAtual});

  @override
  State<TarefaView> createState() => _TarefaViewState();
}

class _TarefaViewState extends State<TarefaView> {
  bool tarefaExpandida = false;

  @override
  Widget build(BuildContext context) {
    final tarefaViewModel = Provider.of<TarefaViewModel>(context, listen: false);
    final usuarioViewModel = Provider.of<UsuarioViewModel>(context, listen: false);

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color(0xFFF7F2FA),
      child: Column(
        children: [
          ListTile(
            // Título
            title: Text(widget.tarefaAtual.tituloTarefa),
            
            // CheckBox
            leading: Checkbox(
              value: widget.tarefaAtual.tarefaFeita,
              activeColor: const Color(0xFF00FF77),
              onChanged: (newBool) {
                if (usuarioViewModel.usuario?.id != null) {
                   tarefaViewModel.alternarStatusTarefa(
                     usuarioViewModel.usuario!.id!, 
                     widget.tarefaAtual, 
                     newBool ?? false
                   );
                }
              },
            ),

            // Botão Expandir
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  tarefaExpandida = !tarefaExpandida;
                });
              },
              icon: Icon(
                tarefaExpandida ? Icons.expand_less : Icons.expand_more,
                color: const Color(0xFF000000),
              ),
            ),
            onTap: () {
              setState(() {
                tarefaExpandida = !tarefaExpandida;
              });
            },
          ),

          // Conteúdo Expansível
          if (tarefaExpandida)
            Column(
              children: [
                const Divider(height: 20, indent: 16, endIndent: 16),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.tarefaAtual.descricaoTarefa,
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                const Divider(height: 20, indent: 16, endIndent: 16),
                
                // Botões de Ação
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Editar
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => EditarTarefaView(
                                tarefaId: widget.tarefaAtual.id,
                                tituloTarefaAtual: widget.tarefaAtual.tituloTarefa,
                                descricaoTarefaAtual: widget.tarefaAtual.descricaoTarefa,
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit, size: 30, color: Color(0xFFFF9B00)),
                        ),
                        const Text('Editar', style: TextStyle(color: Color(0xFFFF9B00), fontSize: 14)),
                      ],
                    ),
                    const SizedBox(width: 40),
                    // Excluir
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => ExcluirTarefaView(
                                tarefaId: widget.tarefaAtual.id,
                                tituloTarefa: widget.tarefaAtual.tituloTarefa,
                              ),
                            );
                          },
                          icon: const Icon(Icons.delete, size: 30, color: Color(0xFFFF1800)),
                        ),
                        const Text('Excluir', style: TextStyle(color: Color(0xFFFF1800), fontSize: 14)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
        ],
      ),
    );
  }
}
