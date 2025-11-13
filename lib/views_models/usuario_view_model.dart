import 'package:anote_e_lembre/models/usuario_model.dart';
import 'package:flutter/material.dart';

class UsuarioViewModel extends ChangeNotifier {
  String? _usuarioId;
  String? get usuarioId => _usuarioId;

  String? _msgTelaLogin;
  String? get msgTelaLogin => _msgTelaLogin;

  Usuario? usuario;

  Future<bool> cadastrarUsuario(String nome, String email, String senha) async {
    usuario = Usuario(nome, email, senha);
    final resultado = await usuario!.criarConta();
    if (resultado["criado"]) {
      _msgTelaLogin = resultado["msg"];
      notifyListeners();
      return true;
    } else {
      _msgTelaLogin = resultado["msg"];
      notifyListeners();
      return false;
    }
  }

  Future<bool> login(String email, String senha) async {
    usuario = Usuario("", email, senha);

    final resultado = await usuario!.login();

    if (resultado["logado"]) {
      final usuarioLogado = resultado["usuario"];
      usuario?.id = usuarioLogado.uid;
      usuario?.nome = usuarioLogado?.displayName ?? "";
      usuario?.email = usuarioLogado.email ?? "";

      _msgTelaLogin = resultado["msg"];

      notifyListeners();
      return true;
    } else {
      _msgTelaLogin = resultado["msg"];
      notifyListeners();
      return false;
    }
  }

  void logout() async {
    await usuario?.logout();
    usuario = null;
    notifyListeners();
  }

  Future<bool> resetarSenha(String email) async {
    Usuario usuario = Usuario("", email, "");

    final resultado = await usuario.resetarSenha(email);

    if (resultado["enviado"]) {
      _msgTelaLogin = resultado["msg"];
      notifyListeners();
      return true;
    } else {
      _msgTelaLogin = resultado["msg"];
      notifyListeners();
      return false;
    }
  }
}
