import 'package:flutter/material.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Application/Services/PickerServices/picker_services.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Data/DataSource/Resources/Extensions/responsive_extention.dart';
import 'package:todoappcleanarchitecturedemo/SRC/Presentation/Widgets/Auth/login_screen.dart';

import 'SRC/Data/AppData/data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Data.app.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return MaterialApp(
      title: 'To Do App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UserForm(),
    );
  }
}
