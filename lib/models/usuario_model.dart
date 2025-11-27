import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Usuario {
  String? id;
  String nome;
  String email;
  String senha;

  FirebaseAuth _auth = FirebaseAuth.instance;

  Usuario(this.nome, this.email, this.senha);

  Future<Map<String, dynamic>> criarConta() async {
    try {
      final contaCadastrada = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      final user = FirebaseAuth.instance.currentUser;
      final userRef = FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user?.uid);

      await userRef.set({
        'nome': nome,
        'email': email,
        'dataRegistro': DateTime.now(),
      });

      return {
        "criado": true,
        "conta": contaCadastrada,
        "msg": "Conta criada com sucesso",
      };
    } on FirebaseAuthException catch (e) {
      return {"criado": false, "msg": "Erro: " + e.message.toString()};
    }
  }

  Future<Map<String, dynamic>> login() async {
    try {
      final credencial = await _auth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );

      FirebaseFirestore.instance
          .collection('usuarios')
          .doc(credencial.user?.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
            if (documentSnapshot.exists) {
              nome = documentSnapshot.get('nome');
              email = documentSnapshot.get('email');
            }
          });

      return {
        "logado": true,
        "usuario": credencial.user,
        "nome": nome,
        "email": email,
        "msg": "Login criada com sucesso.",
      };
    } on FirebaseAuthException catch (e) {
      return {"logado": false, "usuario": null, "msg": e.message};
    }
  }

  Future<void> logout() async {
    return _auth.signOut();
  }

  Future<Map<String, dynamic>> resetarSenha(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return {
        "enviado": true,
        "msg": "E-mail de redifinição enviado para $email.",
      };
    } on FirebaseAuthException catch (e) {
      return {"enviado": false, "msg": "Erro ao enviar o e-mail: ${e.message}"};
    }
  }
}
