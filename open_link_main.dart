/*
** Copyright (C) Ken Jin.
**
** This program is free software; you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation; either version 2 of the License, or
** (at your option) any later version.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with this program; if not, write to the Free Software
** Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
**/

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

void main() {
  runApp(const MyApp());
}

class SectionLink extends StatelessWidget {
  const SectionLink({super.key});

  Future<void> _openLink() async {
    final url = Uri.parse(_versionUrl);
    if (await launcher.canLaunchUrl(url)) {
      await launcher.launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [TextButton(onPressed: _openLink, child: Text("Open"))],
        ),
      ),
      body: Text("data"),
    );
  }
}

final String _versionUrl = "https://techandlife.github.io/hlife/version.html";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'HLife open link demo', home: SectionLink());
  }
}
