import 'package:flutter/material.dart';
import 'package:news_app_c13/presentation/category_screen/category_screen.dart';
import 'package:news_app_c13/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {super.key, required this.title, this.actions, this.body});
  final String title;
  final List<Widget>? actions;
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Text('News App')),
            ListTile(
              title: Text('Go to Home'),
              leading: Icon(Icons.home),
              onTap: () {
                //ToDo navigate to category Screen
                Navigator.pushNamed(context, CategoryScreen.routeName);
              },
            ),


            ListTile(
              title: Text(''),
              leading: Icon(themeProvider.isDarkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onTap: () {
                themeProvider.setThemeModeProvider(
                    themeProvider.isDarkTheme
                    ? ThemeMode.light
                    : ThemeMode.dark);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: actions,
      ),
      body: body,
    );
  }
}
