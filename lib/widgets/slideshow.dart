import 'package:flutter/material.dart';
import 'package:layouts/models/slider_model.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;

  SlideShow({@required this.slides});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => SliderModel(),
        child: Center(
          child: Column(children: [
            Expanded(child: _Slides(this.slides)),
            _DotsSlide(slides.length)
          ]),
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
      Provider.of<SliderModel>(context, listen: false).currentPage =
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: new List.generate(totalSlides, (index) => _Dot(index)),
        ));
  }
}

class _Dot extends StatelessWidget {
  final index;

  _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final pageIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 10,
      height: 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (pageIndex >= index - 0.5 && pageIndex < index + 0.5)
              ? Colors.pinkAccent
              : Colors.black26,
          shape: BoxShape.circle),
    );
  }
}
