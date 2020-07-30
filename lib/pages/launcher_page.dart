import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layouts/routes/routes.dart';
import 'package:layouts/theme/theme.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Flutter designs'),
        ),
        drawer: _MainMenu(),
        body: _OptionsList());
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0),
        itemBuilder: (context, i) => ListTile(
              leading: FaIcon(
                pageRoutes[i].icon,
                color: Colors.blue,
              ),
              title: Text(pageRoutes[i].title),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => pageRoutes[i].page)),
            ),
        separatorBuilder: (context, i) => Divider(
              color: Colors.grey,
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
                  backgroundColor: Colors.blue,
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
              leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
              title: Text('Dark Mode'),
              trailing: Switch.adaptive(
                  activeColor: Colors.blue,
                  value: appTheme.darMode,
                  onChanged: (value) => appTheme.darkMode = value),
            ),
            ListTile(
              leading: Icon(Icons.add_to_home_screen, color: Colors.blue),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  activeColor: Colors.blue,
                  onChanged: (value) => appTheme.customTheme = value),
            ),
          ],
        ),
      ),
    );
  }
}
