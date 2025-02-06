import 'package:flutter/material.dart';
import 'package:news_app_c13/presentation/category_screen/category_screen.dart';
import 'package:news_app_c13/presentation/news_screen/new_screen.dart';
import 'package:news_app_c13/presentation/providers/theme_provider.dart';
import 'package:news_app_c13/presentation/resourses/theme_manger.dart';
import 'package:provider/provider.dart';

/// Http Request Link:(Base Url/EndPoint(Api) ? Query Params - Path Variables)
/// Type (GET - POST - ....)
/// Headers(json)
/// Arguments:
///  GET: (Included in api link Example: Query Params - Path Variables)
///  POST: Arguments included in request body (JSON)
/////////////////////////////////////////////////////////
/// Http Response:
/// BODY(JSON - HTML - XML) - Headers- status code(20x-40x-50x)
///
/// jSON {STRING(Key): (NUM - STRING - NULL - JSON - LIST)}
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        NewsScreen.routeName: (context) => NewsScreen(),
        CategoryScreen.routeName: (context) => CategoryScreen(),
      },
      theme: ThemeManger.lightTheme,
      darkTheme: ThemeManger.darkTheme,
      themeMode: themeProvider.getCurrentTheme,
      initialRoute: CategoryScreen.routeName,
    );
  }
}
