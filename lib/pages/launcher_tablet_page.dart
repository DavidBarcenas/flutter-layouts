import 'package:flutter/material.dart';
import 'package:layouts/pages/slideshow_page.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layouts/routes/routes.dart';
import 'package:layouts/theme/theme.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Flutter designs - Tablet'),
        ),
        drawer: _MainMenu(),
        body: Row(
          children: <Widget>[
            Container(
              width: 300,
              height: double.infinity,
              color: Colors.black12,
              child: _OptionsList(),
            ),
            Expanded(
              child: SlideShowPage(),
            )
          ],
        ));
    // body: _OptionsList());
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).currenTheme;

    return ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0),
        itemBuilder: (context, i) => ListTile(
              leading: FaIcon(
                pageRoutes[i].icon,
                color: theme.accentColor,
              ),
              title: Text(pageRoutes[i].title),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => pageRoutes[i].page)),
            ),
        separatorBuilder: (context, i) => Divider(
              color: theme.primaryColorLight,
            ),
        itemCount: pageRoutes.length);
  }
}

class _MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 150,
                child: CircleAvatar(
                  backgroundColor: appTheme.currenTheme.accentColor,
                  child: Text(
                    'DB',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ),
            Expanded(child: _OptionsList()),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.lightbulb_outline,
                  color: appTheme.currenTheme.accentColor),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                  activeColor: appTheme.currenTheme.accentColor,
                  value: appTheme.darMode,
                  onChanged: (value) => appTheme.darkMode = value),
            ),
            ListTile(
              leading: Icon(Icons.add_to_home_screen,
                  color: appTheme.currenTheme.accentColor),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: appTheme.currenTheme.accentColor,
                  onChanged: (value) => appTheme.customTheme = value),
            ),
          ],
        ),
      ),
    );
  }
}
