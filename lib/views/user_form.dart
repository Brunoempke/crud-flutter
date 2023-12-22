import 'package:crud/models/user.dart';
import 'package:crud/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)!.settings.arguments as User?;

    if (user != null) {
      _loadFormData(user);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _form.currentState!.save();

              Provider.of<Users>(context, listen: false).put(
                User(
                  id: _formData['id'] ?? '',
                  nome: _formData['nome'] ?? '',
                  email: _formData['email'] ?? '',
                  imgUrl: _formData['imgUrl'] ?? '',
                ),
              );

              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) => _formData['nome'] = value!,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                initialValue: _formData['imgUrl'],
                decoration: InputDecoration(labelText: 'Url da imagem'),
                onSaved: (value) => _formData['imgUrl'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loadFormData(User user) {
  if(user != null)
    _formData['id'] = user.id;
    _formData['nome'] = user.nome;
    _formData['email'] = user.email;
    _formData['imgUrl'] = user.imgUrl;
  }
}
