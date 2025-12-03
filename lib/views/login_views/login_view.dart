import 'package:anote_e_lembre/views_models/usuario_view_model.dart';
import 'package:anote_e_lembre/views/login_views/cadastro_view.dart';
import 'package:anote_e_lembre/views/lista_tarefa_views/lista_tarefas_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anote_e_lembre/views/login_views/reset_senha_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController senhaController = TextEditingController();

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: const EdgeInsets.all(16.00),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            Image(image: AssetImage('assets/images/anote-e-lembre-logo.png')),

            SizedBox(height: 10),

            // Formulário Email.
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

            //Espaçamento
            SizedBox(height: 0.0),

            Consumer<UsuarioViewModel>(
              builder: (context, viewModel, child) {
                return ElevatedButton(
                  onPressed: () async {
                    var user = await viewModel.login(
                      emailController.text,
                      senhaController.text,
                    );

                    if (user) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListaTarefasView(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(viewModel.msgTelaLogin.toString()),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(900, 40),
                    backgroundColor: const Color(0xFFFFD900),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                );
              },
            ),

            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CadastroView();
                  },
                );
              },
              child: Text(
                'Não tem conta? Cadastra-se!',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),

            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return ResetSenhaView();
                  },
                );
              },
              child: Text(
                'Esqueceu a senha?',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
