import 'package:flutter/material.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/editar_tarefa_view.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/excluir_tarefa_view.dart';

class TarefaView extends StatefulWidget {
  const TarefaView({super.key});

  @override
  State<TarefaView> createState() => _TarefaViewState();
}

class _TarefaViewState extends State<TarefaView> {
  bool tarefaFeita = false;
  bool tarefaExpandida = false;

  @override
  Widget build(BuildContext context) {
    // Formatação Card
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: const Color(0xFFF7F2FA),

      child: Column(
        children: [
          // Cabeçalho (Sempre Visível)
          ListTile(
            // Título da Tarefa
            title: const Text("Título da Tarefa"),

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

            // Expandir
            trailing: IconButton(
              // Lógica da Expansão
              onPressed: () {
                setState(() {
                  tarefaExpandida = !tarefaExpandida;
                });
              },

              // Ícone Expandir
              icon: Icon(
                tarefaExpandida ? Icons.expand_less : Icons.expand_more,
                color: Color(0xFF000000),
              ),
            ),

            // Lógica da Expansão
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
                //  Divisão entre Título e Descrição
                Divider(height: 20, indent: 16, endIndent: 16),

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla iaculis elit id magna ultrices, laoreet fringilla nulla iaculis. Suspendisse mattis, neque id tincidunt facilisis, nibh purus pulvinar enim, et pretium neque tellus maximus felis. Sed mauris lorem, semper in urna nec, eleifend mattis orci.",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14),
                  ),
                ),

                //  Divisão entre Descrição e os Botões de Ações
                Divider(height: 20, indent: 16, endIndent: 16),

                // Botões de Ações (Editar e Excluir)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  // Botão Editar
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => EditarTarefaView(),
                            );
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 30,
                            color: Color(0xFFFF9B00),
                          ),
                        ),
                        Text(
                          'Editar',
                          style: TextStyle(
                            color: Color(0xFFFF9B00),
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    //Espaçamento entre os Botões
                    SizedBox(width: 40),

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
                          icon: Icon(
                            Icons.delete,
                            size: 30,
                            color: Color(0xFFFF1800),
                          ),
                        ),
                        Text(
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
                SizedBox(height: 8),
              ],
            ),
        ],
      ),
    );
  }
}
