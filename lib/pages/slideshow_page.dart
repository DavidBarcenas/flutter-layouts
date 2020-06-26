import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:layouts/widgets/slideshow.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(child: WrapSlideshow()),
      Expanded(child: WrapSlideshow())
    ]));
  }
}

class WrapSlideshow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideShow(
      primaryBullet: 15,
      slides: <Widget>[
        SvgPicture.asset('assets/svg/slide-1.svg'),
        SvgPicture.asset('assets/svg/slide-2.svg'),
        SvgPicture.asset('assets/svg/slide-3.svg'),
        SvgPicture.asset('assets/svg/slide-4.svg'),
        SvgPicture.asset('assets/svg/slide-5.svg'),
      ],
    );
  }
}
