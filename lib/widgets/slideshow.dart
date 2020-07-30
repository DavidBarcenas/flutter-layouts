import 'package:flutter/material.dart';
import 'package:layouts/theme/theme.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool topIndicator;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  SlideShow(
      {@required this.slides,
      this.topIndicator = false,
      this.primaryColor = Colors.pinkAccent,
      this.secondaryColor = Colors.black26,
      this.primaryBullet = 12,
      this.secondaryBullet = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _SlideShowModel(),
        child: SafeArea(
          child: Center(child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideShowModel>(context).primaryColor =
                  Provider.of<ThemeChanger>(context).darMode
                      ? Provider.of<ThemeChanger>(context)
                          .currenTheme
                          .accentColor
                      : this.primaryColor;
              Provider.of<_SlideShowModel>(context).secondaryColor =
                  this.secondaryColor;
              Provider.of<_SlideShowModel>(context).primaryBullet =
                  this.primaryBullet;
              Provider.of<_SlideShowModel>(context).secondaryBullet =
                  this.secondaryBullet;

              return Column(children: [
                if (this.topIndicator) _DotsSlide(slides.length),
                Expanded(child: _Slides(this.slides)),
                if (!this.topIndicator) _DotsSlide(slides.length)
              ]);
            },
          )),
        ));
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      // Provider Update - Slider Model
      Provider.of<_SlideShowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        // children: <Widget>[
        //   _Slide('assets/svg/slide-1.svg'),
        //   _Slide('assets/svg/slide-2.svg'),
        //   _Slide('assets/svg/slide-3.svg'),
        // ]
        children: widget.slides.map((e) => _Slide(e)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(18),
      child: slide,
    );
  }
}

class _DotsSlide extends StatelessWidget {
  final int totalSlides;
  _DotsSlide(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        // color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: new List.generate(totalSlides, (index) => _Dot(index)),
        ));
  }
}

class _Dot extends StatelessWidget {
  final index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<_SlideShowModel>(context);
    Color color;
    double size;

    if (provider.currentPage >= index - 0.5 &&
        provider.currentPage < index + 0.5) {
      color = provider.primaryColor;
      size = provider.primaryBullet;
    } else {
      color = provider.secondaryColor;
      size = provider.secondaryBullet;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _SlideShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.pinkAccent;
  Color _secondaryColor = Colors.black26;
  double _primaryBullet = 12;
  double _secondaryBullet = 12;

  double get currentPage => this._currentPage;

  set currentPage(double page) {
    this._currentPage = page;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor(Color color) {
    this._primaryColor = color;
    // notifyListeners();
  }

  Color get secondaryColor => this._secondaryColor;
  set secondaryColor(Color color) {
    this._secondaryColor = color;
    // notifyListeners();
  }

  double get primaryBullet => this._primaryBullet;
  set primaryBullet(double size) {
    this._primaryBullet = size;
    // notifyListeners();
  }

  double get secondaryBullet => this._secondaryBullet;
  set secondaryBullet(double size) {
    this._secondaryBullet = size;
    // notifyListeners();
  }
}
