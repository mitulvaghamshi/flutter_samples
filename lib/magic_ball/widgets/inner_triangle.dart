import 'package:flutter/material.dart';

/// A class that draws an 8-Ball predictive blue triangle containing text
class InnerTriangle extends StatelessWidget {
  /// Default constructor
  const InnerTriangle({super.key, required this.text});

  /// The text of the current prediction
  final String text;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TrianglePainter(),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class _TrianglePainter extends CustomPainter {
  final _gradient = const LinearGradient(colors: [
    Color(0xFFD8ECFF),
    Color(0xFF3787FF),
  ]);

  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint()
      ..shader = _gradient.createShader(Offset.zero & size)
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;
    final path = Path()
      ..moveTo(w * 0.2, h * 0.3)
      ..quadraticBezierTo(w * 0.5, h * 0.1, w * 0.8, h * 0.3)
      ..quadraticBezierTo(w * 0.85, h * 0.6, w * 0.5, h * 0.85)
      ..quadraticBezierTo(w * 0.15, h * 0.6, w * 0.2, h * 0.3)
      ..close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(_TrianglePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_TrianglePainter oldDelegate) => false;
}
