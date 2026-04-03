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

class SectionEditor extends StatelessWidget {
  const SectionEditor({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          maxLines: 1000000,
          minLines: 100,
          controller: controller,
          decoration: InputDecoration(border: UnderlineInputBorder()),
        ),
      ),
    );
  }
}

class SectionRunFunc extends StatefulWidget {
  const SectionRunFunc({super.key});

  @override
  State<SectionRunFunc> createState() => _SectionRunFuncState();
}

class _SectionRunFuncState extends State<SectionRunFunc> {
  late TextEditingController myController;

  @override
  void initState() {
    super.initState();

    //doSomething.
    myController = TextEditingController(text: "Init value.");
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  bool _check() {
    String text = myController.text;
    if (text.trim().isEmpty) {
      return false;
    } else {
      //doSomething.
      return true;
    }
  }

  void _run() {
    if (!_check()) {
      return;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [TextButton(onPressed: _run, child: Text("Check"))],
        ),
      ),
      body: SectionEditor(controller: myController),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'HLife Text input demo', home: SectionRunFunc());
  }
}
