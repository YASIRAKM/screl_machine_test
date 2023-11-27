import 'package:flutter/material.dart';
import 'package:flutter_test_user/model/user_model.dart';
import 'package:intl/intl.dart';
import '../utils/const/theme_data/color.dart';
import '../utils/widget/text_widget.dart';

class DetailedView extends StatelessWidget {
  final UserModel user;

  const DetailedView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.sizeOf(context).height;
    final wt = MediaQuery.sizeOf(context).width;
    DateTime createdAt =user.createdAt;

    String timeDate = DateFormat('dd-MM -- H:mm:ss').format(createdAt);

    return Scaffold(
        appBar: AppBar(
          title:const  Text('USER DETAILS'),
        ),
        body: Padding(
          padding:  EdgeInsets.only(top: ht*.05,left: wt*.05,right: wt*.05),
          child: Column(
            children: [
              CircleAvatar(radius: wt*.15,backgroundColor: AppColor.cardColor,
                  child: const  Icon(Icons.person,size: 70,)),
              SizedBox(height:ht*.05),
              SizedBox(
                  height: ht * .45,
                  width: wt,
                  child: Card(
                    child: Padding(
                      padding:  EdgeInsets.only(left: wt*.05,top: ht*.02,bottom: ht*.08),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            NewTxt(
                              header: 'ID',
                              wt: wt * .1,
                              value: user.id,
                            ),
                            NewTxt(
                              header: 'Name',
                              wt: wt * .02,
                              value: user.name,
                            ),
                            NewTxt(
                              header: 'E mail',
                              wt: wt * .02,
                              value: user.email,
                            ),
                            NewTxt(
                              header: 'Time',
                              wt: wt * .01,
                              value: timeDate,
                            ),
                          ]),
                    ),
                  )),
            ],
          ),
        ));
  }
}
