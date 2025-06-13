import 'package:flutter/material.dart';
import 'package:notes/Authentication/login/LoginUi.dart';
import 'package:notes/Authentication/register/RegisterUi.dart';
import 'package:notes/Dashboard/AddNoteScreen.dart';
import 'package:notes/Dashboard/DasboardUi.dart';
import 'package:notes/Settings/profile_setting.dart';
import 'package:notes/components/ThemeProvider.dart';
import 'package:notes/database/EncryptedDatabase.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:sonner_flutter/sonner_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EncryptedDatabase database = EncryptedDatabase();
  await database.init();
  Get.put<EncryptedDatabase>(database);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final database = EncryptedDatabase.instance;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(useMaterial3: true),

      theme: ThemeData.light(useMaterial3: true),
      home: (database.read("isLoginDone") ?? false) ? Dashboard() : Login(),
      themeMode: themeProvider.themeMode,
      builder: (context, child) {
        return Stack(children: [child!, const Toaster()]);
      },
      // home:NoteEdit()
    );
  }
}
