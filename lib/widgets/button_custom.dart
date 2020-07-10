import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonCustom extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color primaryColor;
  final Color seconadyColor;
  final Function onPress;

  static const Color primaryColorDefault = Color(0xff6989f5);
  static const Color secondaryColorDefault = Color(0xff906ef5);

  const ButtonCustom(
      {this.icon = FontAwesomeIcons.carCrash,
      @required this.text,
      this.primaryColor = primaryColorDefault,
      this.seconadyColor = secondaryColorDefault,
      @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: <Widget>[
          _BackgroundButton(this.primaryColor, this.seconadyColor, this.icon),
          Container(
            height: 100,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FaIcon(
                  this.icon,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(this.text,
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                Expanded(child: Container()),
                FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _BackgroundButton extends StatelessWidget {
  final IconData icon;
  final Color primaryColor;
  final Color seconadyColor;

  const _BackgroundButton(this.primaryColor, this.seconadyColor, this.icon);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(4, 6), blurRadius: 10),
            ],
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [this.primaryColor, this.seconadyColor])),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -20,
                  right: -20,
                  child: FaIcon(
                    this.icon,
                    size: 150,
                    color: Colors.white12,
                  )),
            ],
          ),
        ));
  }
}
