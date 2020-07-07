import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:layouts/widgets/header.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IconHeader(
      icon: FontAwesomeIcons.plus,
      subtitle: 'Haz Solicitado',
      title: 'Asistencia Médica',
    ));
  }
}
