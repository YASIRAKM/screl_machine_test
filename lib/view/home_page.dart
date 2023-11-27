import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/widget/text_widget.dart';
import '../view_model/view_model.dart';
import 'detailed_view.dart';
import 'user_add_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.sizeOf(context).height;
    final wt = MediaQuery.sizeOf(context).width;
    final TextEditingController searchController = TextEditingController();

    final controller = Provider.of<UserViewModel>(context);

    return Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const UserAdd()));
            },
            child: const Icon(Icons.add)),
        appBar: AppBar(
          title: const Text('User List'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: wt * .05,
                  top: ht * .03,
                  right: wt * .05,
                  bottom: ht * .02),
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
              height: ht * .7,
              child: Consumer<UserViewModel>(
                builder: (context, controller, child) {
                  return controller.user.isEmpty
                      ? IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const UserAdd()));
                          },
                          icon: const Icon(Icons.add))
                      : ListView.builder(
                          itemCount: controller.user.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 0,
                              margin: EdgeInsets.only(
                                  left: wt * .05,
                                  right: wt * .05,
                                  bottom: ht * .01),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => DetailedView(
                                                    user:
                                                        controller.user[index],
                                                  )));
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: ht * .01, left: wt * .05),
                                      child: Container(
                                        height: ht * .1,
                                        width: wt * .7,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          children: [
                                            NewTxt(
                                              header: 'Name',
                                              value:
                                                  controller.user[index].name,
                                              wt: wt * .05,
                                            ),
                                            SizedBox(height: ht * .01),
                                            NewTxt(
                                              header: 'Email',
                                              value:
                                                  controller.user[index].email,
                                              wt: wt * .05,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Column(
                                                children: [
                                                  Text(
                                                      "Dou yo want to delete ${controller.user[index].name}"),
                                                  SizedBox(height: ht*.02,),
                                                  ElevatedButton(onPressed: (){
                                                    controller.deleteUser(controller.user[index]);
                                                  }, child: const Text("Delete"))
                                                ],
                                              ),

                                            );
                                          },
                                        );

                                        // controller.deleteUser(controller.user[index]);
                                      },
                                      icon: const Icon(Icons.delete)),
                                ],
                              ),
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


