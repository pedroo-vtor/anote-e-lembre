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
      title: Text(
        'Cadastro',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 30,
        children: [
          SizedBox(height: 1),

          // Formulário Nome
          TextField(
            controller: nomeController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF5F5F5),
              hintText: 'nome',
              prefixIcon: Icon(Icons.person_outline, color: Colors.black),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF838287)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF838287)),
              ),
            ),
          ),

          // Formulário email
          TextField(
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

          // Formulário senha.
          TextField(
            controller: senhaController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'senha',
              filled: true,
              fillColor: Color(0xFFF5F5F5),
              prefixIcon: Icon(Icons.password, color: Colors.black),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF838287)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF838287)),
              ),
            ),
            obscureText: true,
          ),

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
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFFFD900),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: Text(
                      "Cadastrar",
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
  }
}
