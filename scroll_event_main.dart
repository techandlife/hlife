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

void main() {
  runApp(const MyApp());
}

class SectionList extends StatefulWidget {
  const SectionList({super.key});

  @override
  State<SectionList> createState() => _SectionListState();
}

class _SectionListState extends State<SectionList> {
  late ScrollController _sCtrl;

  @override
  void initState() {
    super.initState();
    _sCtrl = ScrollController(initialScrollOffset: 200);
    _sCtrl.addListener(scroll);
  }

  @override
  void dispose() {
    _sCtrl.removeListener(scroll);
    _sCtrl.dispose();
    super.dispose();
  }

  void _jump() {
    _sCtrl.jumpTo(600);
  }

  void scroll() {
    print("scrolling.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Scrollbar demo"),
            TextButton(onPressed: _jump, child: Text("Jump")),
          ],
        ),
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 99,
          itemBuilder: (context, index) {
            return Text("item $index");
          },
          controller: _sCtrl,
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'HLife scrollbar demo', home: SectionList());
  }
}
