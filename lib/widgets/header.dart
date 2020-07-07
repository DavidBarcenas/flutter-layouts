import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _BackgroundHeader(),
        Positioned(
            top: -40,
            left: -40,
            child: FaIcon(
              FontAwesomeIcons.plus,
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
              'Haz solicitado',
              style: TextStyle(fontSize: 20, color: Colors.white60),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Asistencia Médica',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            FaIcon(
              FontAwesomeIcons.plus,
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
  const _BackgroundHeader({
    Key key,
  }) : super(key: key);

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
              colors: <Color>[Color(0xff526bf6), Color(0xff67acf2)])),
    );
  }
}
