import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Color primaryColor;
  final Color secondaryColor;

  static const pcolor = Color(0xff526bf6);
  static const scolor = Color(0xff67acf2);

  const IconHeader(
      {@required this.icon,
      @required this.title,
      @required this.subtitle,
      this.primaryColor = pcolor,
      this.secondaryColor = scolor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _BackgroundHeader(this.primaryColor, this.secondaryColor),
        Positioned(
            top: -40,
            left: -40,
            child: FaIcon(
              this.icon,
              size: 200,
              color: Colors.white.withOpacity(0.2),
            )),
        Column(
          children: <Widget>[
            SizedBox(
              height: 60,
              width: double.infinity,
            ),
            Text(
              this.subtitle,
              style: TextStyle(fontSize: 20, color: Colors.white60),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.title,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            FaIcon(
              this.icon,
              size: 45,
              color: Colors.white,
            )
          ],
        )
      ],
    );
  }
}

class _BackgroundHeader extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;

  const _BackgroundHeader(
    this.primaryColor,
    this.secondaryColor,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[this.primaryColor, this.secondaryColor])),
    );
  }
}
