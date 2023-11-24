import 'package:flutter/material.dart';
import 'package:flutter_test_user/model/user_model.dart';
import 'package:provider/provider.dart';

import '../view_model/view_model.dart';
import 'detailed_view.dart';
import 'user_add_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    final controller = Provider.of<UserViewModel>(context);
    // controller.getHive();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const UserAdd()));
            },
            child: const Icon(Icons.add)),
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 20, right: 10, bottom: 10),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    labelText: 'Search',
                    suffixIcon: InkWell(
                        onTap: () {
                          controller.searchUsers(searchController.text);
                        },
                        child: const Icon(Icons.search))),
              ),
            ),
            SizedBox(
              height: 500,
              child: Consumer<UserViewModel>(
                builder: (context, controller, child) {
                  return controller.user.isEmpty
                      ? IconButton(
                          onPressed: () {}, icon: const Icon(Icons.add))
                      : ListView.builder(
                          itemCount: controller.user.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => DetailedView(
                                                  user: controller.user[index],
                                                )));
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Text(
                                            "Name : ${controller.user[index].name}"),
                                        Text(
                                            "Email : ${controller.user[index].email}"),
                                      ],
                                    ),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      controller
                                          .deleteUser(controller.user[index]);
                                    },
                                    icon: const Icon(Icons.delete))
                              ],
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ));
  }
}
