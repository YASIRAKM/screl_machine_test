import 'package:flutter/material.dart';
import 'package:flutter_test_user/model/user_model.dart';
import 'package:flutter_test_user/utils/const/theme_data/app_theme.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'view/home_page.dart';
import 'view_model/view_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  runApp(ChangeNotifierProvider(create: (BuildContext context) =>UserViewModel(),
  child:const  MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:AppTheme.appTheme,
      home:const  HomePage(),
    );
  }
}
