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

class SectionText extends StatefulWidget {
  const SectionText({super.key});

  @override
  State<SectionText> createState() => _SectionTextState();
}

class _SectionTextState extends State<SectionText> {
  late FocusNode _fNode;

  @override
  void initState() {
    super.initState();
    _fNode = FocusNode();
    _fNode.addListener(focus);
  }

  @override
  void dispose() {
    _fNode.removeListener(focus);
    _fNode.dispose();
    super.dispose();
  }

  void focus() {
    if (_fNode.hasFocus) {
      print("get focus;");
    } else {
      print("cancel focus;");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Focus demo")),
      body: Column(
        children: [
          TextField(
            focusNode: _fNode,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              hint: Text("Text input"),
            ),
          ),
          TextButton(
            onPressed: () {
              _fNode.unfocus();
            },
            child: Text("Cancel focus"),
          ),
          TextButton(
            onPressed: () {
              _fNode.requestFocus();
            },
            child: Text("Set focus"),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'HLife focus demo', home: SectionText());
  }
}
