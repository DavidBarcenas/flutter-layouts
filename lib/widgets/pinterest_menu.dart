import 'package:flutter/material.dart';

class PinterestMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<PinterestButton> items = [
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
    ];

    return Center(
      child: _PinterestMenuBackground(child: _MenuItems(items)),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;
  _PinterestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: -5)
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(menuItems.length,
            (index) => _PinterestMenuButton(index, menuItems[index])),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Icon(item.icon, size: 25, color: Colors.black54),
      ),
      onTap: item.onPressed,
      behavior: HitTestBehavior.translucent,
    );
  }
}

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed, @required this.icon});
}
