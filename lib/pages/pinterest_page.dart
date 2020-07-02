import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:layouts/widgets/pinterest_menu.dart';
import 'package:provider/provider.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuFade(),
      child: Scaffold(
          // body: PinterestGrid(),
          // body: PinterestMenu(),
          body: Stack(
        children: <Widget>[PinterestGrid(), PinteresMenuPosition()],
      )),
    );
  }
}

class PinteresMenuPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final show = Provider.of<_MenuFade>(context).show;
    return Positioned(
        left: (MediaQuery.of(context).size.width / 2) - (250 / 2),
        bottom: 30,
        child: PinterestMenu(show: show, items: [
          PinterestButton(
              icon: Icons.pie_chart,
              onPressed: () {
                print('icon pie_chart');
              }),
          PinterestButton(
              icon: Icons.search,
              onPressed: () {
                print('icon search');
              }),
          PinterestButton(
              icon: Icons.notifications,
              onPressed: () {
                print('icon notifications');
              }),
          PinterestButton(
              icon: Icons.supervised_user_circle,
              onPressed: () {
                print('icon supervised_user_circle');
              }),
        ]));
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double scrollAcc = 100;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > scrollAcc) {
        Provider.of<_MenuFade>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuFade>(context, listen: false).show = true;
      }

      scrollAcc = controller.offset;
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final index;

  const _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(12)
            // borderRadius: BorderRadius.circular(5.0)
            ),
        // color: Colors.redAccent,
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

// ****** Provider *******
class _MenuFade with ChangeNotifier {
  bool _show = true;

  bool get show => this._show;

  set show(bool val) {
    this._show = val;
    notifyListeners();
  }
}
