import 'package:anote_e_lembre/views_models/usuario_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<UsuarioViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bem-vindo, usuário ID: ${viewModel.usuario!.id ?? ''}'),
                SizedBox(height: 20),
                Text('E-mail: ${viewModel.usuario!.email}'),

                ElevatedButton(
                  onPressed: () {
                    viewModel.logout();
                    Navigator.pop(context);
                  },
                  child: Text('Logout'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}