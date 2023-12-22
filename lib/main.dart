import 'package:crud/provider/users.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:crud/views/user_form.dart';
import 'package:crud/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      const MyApp()); // Função principal que inicia a execução do aplicativo Flutter
}

class MyApp extends StatelessWidget {
  const MyApp(
      {super.key}); // Construtor da classe MyApp que não recebe argumentos

  // Este widget é a raiz da sua aplicação.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo', // Título da aplicação
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple), // Definição do esquema de cores
          useMaterial3:
              true, // Habilita o uso do Material Design 3 (M3), uma versão atualizada do Material Design
        ),
        home: UserList(),
        routes:{
          AppRoutes.USER_FORM:(_) => UserForm()
        },
      ),
    );
  }
}
