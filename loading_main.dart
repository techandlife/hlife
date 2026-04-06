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

class SectionDecoding extends StatefulWidget {
  const SectionDecoding({super.key});

  @override
  State<SectionDecoding> createState() => _SectionDecState();
}

class _SectionDecState extends State<SectionDecoding> {
  String _text = "";

  Future<void> _copy() async {
    setState(() {
      _text = "data";
    });
  }

  Future<void> _running() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [TextButton(onPressed: _copy, child: Text("Copy"))],
        ),
      ),
      body: FutureBuilder<void>(
        future: _running(),
        builder: (context, snapshot) {
          if (_text.trim().isNotEmpty) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(_text),
                ),
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HLife Loading demo',
      home: Scaffold(body: Center(child: SectionDecoding())),
    );
  }
}
