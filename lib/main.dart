import 'package:flutter/material.dart';
import 'package:news_app_c13/presentation/category_screen/category_screen.dart';
import 'package:news_app_c13/presentation/news_screen/new_screen.dart';
import 'package:news_app_c13/presentation/providers/theme_provider.dart';
import 'package:news_app_c13/presentation/resourses/theme_manger.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider= Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
     routes: {
        NewsScreen.routeName :(context)=> NewsScreen(),
        CategoryScreen.routeName :(context)=> CategoryScreen(),
     },

      theme: ThemeManger.lightTheme,
      darkTheme: ThemeManger.darkTheme,
      themeMode: themeProvider.getCurrentTheme,

      initialRoute: CategoryScreen.routeName,
    );
  }
}


