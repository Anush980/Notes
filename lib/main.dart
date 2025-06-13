import 'package:flutter/material.dart';
import 'package:notes/Screens/LoginUI.dart';
import 'package:notes/Screens/DasboardUI.dart';
import 'package:notes/Screens/Loading/LoadingOverlay.dart';
import 'package:notes/Screens/Components/ThemeProvider.dart';
import 'package:notes/EncryptedDatabase/EncryptedDatabase.dart';
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
      navigatorObservers: [routeObserver],

      theme: ThemeData.light(useMaterial3: true),
      home: (database.read("isLoginDone") ?? false) ? Dashboard() : LoginUI(),
      themeMode: themeProvider.themeMode,
      builder: (context, child) {
        return Stack(children: [child!, const Toaster(position: ToastPosition.bottom,), const LoadingOverlay()]);
      },
      // home:NoteEdit()
    );
  }
}
