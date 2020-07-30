import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:layouts/pages/emergency_page.dart';
import 'package:layouts/pages/pinterest_page.dart';
import 'package:layouts/pages/slideshow_page.dart';
import 'package:layouts/pages/sliver_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideShowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Sliver', SliverPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
