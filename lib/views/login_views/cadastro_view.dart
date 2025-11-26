import 'package:anote_e_lembre/views_models/usuario_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroView extends StatelessWidget {
  const CadastroView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nomeController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController senhaController = TextEditingController();

    return AlertDialog(
      title: Text('Cadastro'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Nome'),
            controller: nomeController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'E-mail'),
            controller: emailController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Senha'),
            controller: senhaController,
            obscureText: true,
          ),
          SizedBox(height: 20),

          Consumer<UsuarioViewModel>(
            builder: (context, viewModel, child) {
              return ElevatedButton(
                onPressed: () async {
                  final usuario = await viewModel.cadastrarUsuario(
                    nomeController.text,
                    emailController.text,
                    senhaController.text,
                  );

                  if (usuario) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(viewModel.msgTelaLogin.toString()),
                      ),
                    );
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(viewModel.msgTelaLogin.toString()),
                      ),
                    );
                  }
                },
                child: Text('Salvar'),
              );
            },
          ),
        ],
      ),
    );
  }
}