import 'package:burevi2/features/presentation/views/current_weather_view/current_weather_view.dart';
import 'package:burevi2/features/presentation/views/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:burevi2/core/service/dependency_injection.dart' as di;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
