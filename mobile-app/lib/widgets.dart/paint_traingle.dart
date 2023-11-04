import 'package:flutter/material.dart';

import '../style/color.dart';

class MyTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.7
      ..color = iconOfAdminClr;

    final path = Path();

    path.moveTo(size.width * 0 / 6, size.height * 0 / 4);
    path.lineTo(size.width * 6 / 6, size.height * 0 / 4);
    path.lineTo(size.width * 3 / 6, size.height * 4 / 4);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
