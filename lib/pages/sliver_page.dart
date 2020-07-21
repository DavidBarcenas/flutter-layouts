import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _MainScroll());
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        // SliverAppBar(
        //   floating: true,
        //   backgroundColor: Colors.red,
        //   title: Text('Prueba'),
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustom(
              minHeight: 170,
              maxHeight: 180,
              child: Container(color: Colors.white, child: _Title())),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          SizedBox(
            height: 150,
          )
        ]))
      ],
    );
  }
}

class _SliverCustom extends SliverPersistentHeaderDelegate {
  final double minHeight, maxHeight;
  final Widget child;

  _SliverCustom(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => (maxHeight > minHeight) ? maxHeight : minHeight;

  @override
  bool shouldRebuild(_SliverCustom oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20, 35, 30, 0),
          child: Text(
            'New',
            style: TextStyle(color: Color(0xff532128), fontSize: 50),
          ),
        ),
        Stack(
          children: <Widget>[
            Positioned(
              bottom: 11,
              child: Container(
                margin: EdgeInsets.only(left: 25),
                width: 140,
                height: 8,
                color: Color(0xfff7cdd5),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              width: 100,
              child: Text(
                'List',
                style: TextStyle(
                    color: Color(0xffd93a30),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _List extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => items[index]);
  }
}

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;

  const _ListItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
      height: 100,
      margin: EdgeInsets.all(10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
    );
  }
}
