import 'package:flutter/material.dart';
import 'package:flutter_test_user/model/user_model.dart';
import 'package:flutter_test_user/view_model/view_model.dart';
import 'package:provider/provider.dart';
import '../utils/const/theme_data/my_text_style.dart';
import '../utils/const/validator.dart';
import '../utils/widget/text_field.dart';

class UserAdd extends StatelessWidget {
  const UserAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    final GlobalKey<FormState> formK = GlobalKey<FormState>();
    final ht = MediaQuery.sizeOf(context).height;
    final wt = MediaQuery.sizeOf(context).width;
    final TextEditingController emailController = TextEditingController();
    final controller = Provider.of<UserViewModel>(context);
    return Scaffold(appBar: AppBar(title:const  Text('ADD USER')),
      body: Padding(
        padding:  EdgeInsets.only(left: wt*.1,right: wt*.1,top: ht*.25),
        child: Form(
          key: formK,
          child: SizedBox(
            height: ht*.3,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NewWidget(
                  nameController: nameController,
                  title: 'Name',
                  type: TextInputType.text,
                  validator: MyValidator.validateName,
                  borderRadius: 10,
                ),
                NewWidget(
                  nameController: emailController,
                  title: 'Email',
                  type: TextInputType.emailAddress,
                  validator: MyValidator.validateEmail,
                  borderRadius: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      int n = controller.user.length + 1;
                      if(formK.currentState!.validate()){

                      final userData = UserModel(
                          id: n.toString(),
                          name: nameController.text,
                          email: emailController.text,
                          createdAt: DateTime.now().toLocal());
                      controller.addUser(userData);}

                      nameController.clear();
                      emailController.clear();
                    },
                    child: const Text('Add User'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


