import 'package:flutter/material.dart';
import 'package:handyman/src/core/theme/app_colors.dart';

class ChatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = AppColors.greenGradient.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    final path = Path();

    path.moveTo(0, 30);

    path.quadraticBezierTo(0, 0, 30, 0);

    path.lineTo(size.width * 0.58, 0);

    path.quadraticBezierTo(size.width - 110, 0, size.width - 110, 30);

    path.quadraticBezierTo(size.width - 110, 60, size.width - 50, 60);

    path.quadraticBezierTo(size.width, 60, size.width, 110);

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
