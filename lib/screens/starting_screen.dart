import 'package:flutter/material.dart';

class StartingScreen extends StatelessWidget {
  const StartingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFD0EEFF),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: -20,
            right: -20,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: FractionallySizedBox(
                widthFactor: 1.2,
                child: CustomPaint(
                  painter: CurvedTopRectanglePainter(),
                  child: Container(),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 62),
                const Text(
                  "Well done!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 16),
                const SizedBox(
                  width: 279,
                  child: Text(
                    "Take a step closer to your journey of a better and healthy life.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 160),
                Image.asset(
                  'assets/images/starting.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 120),
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/main',
                            arguments: 0);
                      },
                      label: const Text(
                        "Let's Start",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0XFF3B3EDE),
                          elevation: 5,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          shadowColor:
                              const Color(0XFF3B3EDE).withOpacity(0.20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CurvedTopRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = const Color(0XFF3B3EDE)
      ..strokeWidth = 90 // Increased border thickness
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Smooth the ends of the border

    final path = Path()
      ..moveTo(0, size.height * 0.30) // Start point for increased curviness
      ..quadraticBezierTo(size.width * 0.5, -size.height * 0.30, size.width,
          size.height * 0.30) // Control point adjusted for more curviness
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final borderPath = Path()
      ..moveTo(0 - borderPaint.strokeWidth / 2,
          size.height * 0.30) // Move the border path slightly outside
      ..quadraticBezierTo(size.width * 0.5, -size.height * 0.30,
          size.width + borderPaint.strokeWidth / 2, size.height * 0.30);

    canvas.drawPath(path, paint);
    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
