import 'package:anote_e_lembre/views_models/usuario_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetSenhaView extends StatelessWidget {
  const ResetSenhaView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return AlertDialog(
      title: Text(
        'Resetar Senha',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),

      // Formulário email
      content: TextField(
        controller: emailController,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xFFF5F5F5),
          hintText: 'email',
          prefixIcon: Icon(Icons.email, color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF838287)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF838287)),
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF999E9A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2),
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
              builder: (context, viewModel, child) {
                return TextButton(
                  onPressed: () async {
                    final emailResultado = await viewModel.resetarSenha(
                      emailController.text,
                    );

                    if (emailResultado) {
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
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFFFFD900),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  child: Text(
                    "Enviar",
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
    );
  }
}
