import 'package:anote_e_lembre/views_models/usuario_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetSenhaView extends StatelessWidget {
  const ResetSenhaView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return AlertDialog(
      title: Text('Resetar Senha'),
      content: TextField(
        decoration: InputDecoration(labelText: 'E-mail'),
        controller: emailController,
      ),
      actions: [
        Consumer<UsuarioViewModel>(
          builder: (context, viewModel, child) {
            return TextButton(
              onPressed: () async {
                final emailResultado = await viewModel.resetarSenha(
                  emailController.text,
                );

                if (emailResultado) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(viewModel.msgTelaLogin.toString())),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(viewModel.msgTelaLogin.toString())),
                  );
                }
              },
              child: Text('Enviar'),
            );
          },
        ),
      ],
    );
  }
}