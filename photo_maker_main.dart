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

import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class CanvasPainter1 extends CustomPainter {
  const CanvasPainter1();

  @override
  void paint(Canvas canvas, Size size) {
    Size mySize = Size(400, 400);
    final Paint paintRect = Paint()..color = Colors.lightBlue;
    final Rect rect = Offset.zero & mySize;
    canvas.drawRect(rect, paintRect);

    final paragraphBuilder = ui.ParagraphBuilder(ParagraphStyle())
      ..addText("this is a photo maker demo.");

    final constraints = ui.ParagraphConstraints(width: mySize.width);
    final paragraph = paragraphBuilder.build();
    paragraph.layout(constraints);
    canvas.drawParagraph(paragraph, Offset.zero);
  }

  @override
  bool shouldRepaint(CanvasPainter1 oldDelegate) => false;
  @override
  bool shouldRebuildSemantics(CanvasPainter1 oldDelegate) => false;
}

class CanvasWidget1 extends StatelessWidget {
  const CanvasWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CustomPaint(painter: CanvasPainter1()));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'HLife photo maker demo', home: CanvasWidget1());
  }
}
