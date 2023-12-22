import 'package:crud/models/user.dart'; // Importa a classe User do arquivo user.dart
import 'package:crud/provider/users.dart';
import 'package:crud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importa o pacote Material, necessário para construir interfaces em Flutter

class UserTile extends StatelessWidget {
  final User user; // Declaração de um objeto User como atributo da classe UserTile

  const UserTile(this.user); // Construtor que recebe um objeto User como parâmetro e o atribui ao atributo 'user'

  @override
  Widget build(BuildContext context) {
    // Verifica se a URL da imagem do usuário é vazia ou nula; se for, exibe um avatar padrão com o ícone de pessoa, caso contrário, exibe a imagem do usuário
    final img = user.imgUrl == '' || user.imgUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person)) // Cria um avatar circular com o ícone de pessoa se a URL for vazia ou nula
        : CircleAvatar(backgroundImage: NetworkImage(user.imgUrl)); // Cria um avatar circular com a imagem fornecida pela URL

    return ListTile(
      // Widget ListTile é usado para exibir um item em uma lista com um layout específico
      leading:img, // Define o avatar como o widget à esquerda do ListTile (leading é a propriedade para o ícone/figura principal à esquerda)
      title: Text(user.nome),  // Define o texto do título como o nome do usuário
      subtitle: Text(user.email),  // Define o texto do subtítulo como o email do usuário   
       trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton( icon: const Icon (Icons.edit), // Ícone do botão de edição
            color: Colors.blue,
             onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
                arguments: user
              );
              },),
            IconButton( icon: const Icon (Icons.delete), // Ícone do botão de exclusão
            color: Colors.red,
             onPressed: () {
              Provider.of<Users>(context, listen: false).remove(user);
              },
            )
          ]
        )
      ),  
    );
  }
}
