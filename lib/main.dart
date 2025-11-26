import 'package:flutter/material.dart';
import 'package:anote_e_lembre/firebase_options.dart';
import 'package:anote_e_lembre/views_models/usuario_view_model.dart';
import 'package:anote_e_lembre/views/login_views/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UsuarioViewModel())],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: LoginView()),
    ),
  );
}