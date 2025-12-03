import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:anote_e_lembre/views_models/usuario_view_model.dart';
import 'package:anote_e_lembre/views/login_views/login_view.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Consumer<UsuarioViewModel>(
        builder: (context, usuarioViewModel, child) {
          final usuarioNome = usuarioViewModel.usuario?.nome ?? '';

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  color: Colors.white,
                  child: Image(
                    image: AssetImage('assets/images/anote-e-lembre-logo.png'),
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Divisão
              Container(height: 1, color: Colors.grey.shade300),

              const SizedBox(height: 20),

              // Usuário
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Icon(Icons.person_outline, size: 28),
                    const SizedBox(width: 10),
                    Text(usuarioNome, style: const TextStyle(fontSize: 18)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Expande para empurrar o logout para baixo
              const Spacer(),

              // Logout
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black)),
                ),
                child: Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        usuarioViewModel.logout();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => LoginView()),
                          (route) => false,
                        );
                      },
                      label: Text(
                        'Logout',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      icon: Icon(Icons.logout, size: 24, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
