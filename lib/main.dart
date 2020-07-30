import 'package:flutter/material.dart';
import 'package:layouts/pages/launcher_page.dart';
import 'package:layouts/theme/theme.dart';
import 'package:provider/provider.dart';
// import 'package:layouts/pages/sliver_page.dart';
// import 'package:layouts/pages/emergency_page.dart';
// import 'package:layouts/pages/pinterest_page.dart';
// import 'package:layouts/pages/slideshow_page.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => ThemeChanger(1), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layouts',
      theme: Provider.of<ThemeChanger>(context).currenTheme,
      home: LauncherPage(),
    );
  }
}
