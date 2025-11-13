import 'package:anote_e_lembre/views_models/usuario_view_model.dart';
import 'package:anote_e_lembre/views/cadastro_view.dart';
import 'package:anote_e_lembre/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anote_e_lembre/views/reset_senha_view.dart';

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
        color: const Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.all(16.00),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            Text(
              'Anote e Lembre (LOGO)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            /*Image(
              height: 100,
              width: 100,
              image: AssetImage('assets/logo-login.jpg'),
            ),*/
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
            ),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
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
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(viewModel.msgTelaLogin.toString()),
                        ),
                      );
                    }
                  },
                  child: Text('Login'),
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
              child: Text('Não tem conta? Cadastra-se!'),
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
              child: Text('Esqueci Minha Senha'),
            ),
          ],
        ),
      ),
    );
  }
}
