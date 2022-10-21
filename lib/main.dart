import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home/home_page.dart';
import 'widgets/responsible.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            Responsible().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Animal Insight Oracle Cards',
              theme: ThemeData(fontFamily: 'kawoszeh'),
              home: const passedloved(),
            );
          },
        );
      },
    );
  }
}
