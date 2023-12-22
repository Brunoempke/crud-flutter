import 'package:crud/components/user_tile.dart';
import 'package:crud/models/user.dart';
import 'package:crud/provider/users.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 

class UserList extends StatelessWidget {
  const UserList({super.key}); // Modificação do construtor

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of<Users>(context); // Correção na instanciação do Provider

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM
              );
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 233, 80, 19),
        foregroundColor: const Color.fromARGB(255, 253, 253, 253),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.all.length, // Atualização para utilizar o getter 'all'
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
      ),
    );
  }
}
