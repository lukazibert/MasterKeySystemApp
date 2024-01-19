import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:master_key_system/screens/build-project/build_project_page.dart';
import 'package:master_key_system/screens/my_projects_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MasterKey System',
        initialRoute: '/home',
        getPages: [
          GetPage(name: '/home', page: () => MyProjectPage()),
          GetPage(
              name: '/build-project',
              page: () => const BuildProjectPage(),
              transition: Transition.rightToLeft)
        ]);
  }
}
