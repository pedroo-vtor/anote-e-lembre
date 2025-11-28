import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import necessário
import 'package:anote_e_lembre/views/lista_tarefa_views/editar_tarefa_view.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/excluir_tarefa_view.dart';
import 'package:anote_e_lembre/views_models/tarefa_view_model.dart'; // Import necessário

class TarefaView extends StatefulWidget {
  // Recebe o índice da tarefa
  final int indexTarefa;

  const TarefaView({super.key, required this.indexTarefa});

  @override
  State<TarefaView> createState() => _TarefaViewState();
}

class _TarefaViewState extends State<TarefaView> {
  bool tarefaFeita = false;
  bool tarefaExpandida = false;

  @override
  Widget build(BuildContext context) {

    return Consumer<TarefaViewModel>(
      builder: (context, tarefaViewModel, child) {
        
        // Recupera o objeto tarefa
        final tarefaAtual = tarefaViewModel.ListaTarefas[widget.indexTarefa];

        // Formatação Card
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 0), // Margin controlado pelo ListView
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: const Color(0xFFF7F2FA),
          child: Column(
            children: [

              // Cabeçalho (Sempre Visível)
              ListTile(
                // Título da Tarefa
                title: Text(
                    tarefaAtual.tituloTarefa ?? "Sem Título"
                ),

                // CheckBox
                leading: Checkbox(
                  value: tarefaFeita,
                  activeColor: const Color(0xFF00FF77),
                  onChanged: (newBool) {
                    setState(() {
                      tarefaFeita = newBool ?? false;
                    });
                  },
                ),

                // Botão para expandir
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
                    // Divisão entre título e o conteúdo expandido.
                    const Divider(height: 20, indent: 16, endIndent: 16),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      // Descrição da Tarefa
                      child: Text(
                        tarefaAtual.descricaoTarefa ?? "Sem descrição",
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),

                    // Divisão entre Descrição e Botões.
                    const Divider(height: 20, indent: 16, endIndent: 16),

                    // Botões de Ações (Editar e Excluir)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        // Botão Editar
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => EditarTarefaView(), 
                                );
                              },
                              icon: const Icon(
                                Icons.edit,
                                size: 30,
                                color: Color(0xFFFF9B00),
                              ),
                            ),
                            const Text(
                              'Editar',
                              style: TextStyle(
                                color: Color(0xFFFF9B00),
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),

                        // Espaçamento entre os botões
                        const SizedBox(width: 40),

                        // Botão Excluir
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => ExcluirTarefaView(),
                                );
                              },
                              icon: const Icon(
                                Icons.delete,
                                size: 30,
                                color: Color(0xFFFF1800),
                              ),
                            ),
                            const Text(
                              'Excluir',
                              style: TextStyle(
                                color: Color(0xFFFF1800),
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
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
      },
    );
  }
}