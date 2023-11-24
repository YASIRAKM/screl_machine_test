import 'package:flutter/material.dart';
import 'package:flutter_test_user/model/user_model.dart';
import 'package:flutter_test_user/view_model/view_model.dart';
import 'package:provider/provider.dart';

class UserAdd extends StatelessWidget {
  const UserAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController idController = TextEditingController();

    final TextEditingController emailController = TextEditingController();
    final controller = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'Id')),
          TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name')),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(labelText: 'email'),
          ),
          ElevatedButton(
              onPressed: () {
                final userData = UserModel(
                    id: idController.text,
                    name: nameController.text,
                    email: emailController.text,
                    createdAt: DateTime.now().toLocal());
                controller.addUser(userData);
                idController.clear();
                nameController.clear();
                emailController.clear();
              },
              child: const Text('Add User'))
        ],
      ),
    );
  }
}
