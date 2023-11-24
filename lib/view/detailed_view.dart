import 'package:flutter/material.dart';
import 'package:flutter_test_user/model/user_model.dart';

class DetailedView extends StatelessWidget {
  final UserModel user;
  const DetailedView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(height: 500,width: 300,
          child: Column(crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Name : ${user.name}"),
              Text("Email : ${user.email}"),
              Text("Created At : ${user.createdAt.toString()}"),


            ],
          ),
        ),
      ),

    );
  }
}
