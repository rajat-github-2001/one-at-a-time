import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, dynamic>> questions = [
    {
      'question': "What's on your mind?",
      'options': [
        "Release Stress",
        "Practice Mindfulness",
        "Boost Productivity"
      ]
    },
    {
      'question': "How often do you handle your thoughts?",
      'options': [
        "Not at all, struggling",
        "Occasionally, manageable chaos",
        "Regularly, well-organized"
      ]
    },
    {
      'question': "What’s your background in?",
      'options': ["Tech Junkie", "Fitness Rat", "Teacher", "Other"]
    },
    {
      'question': "What’s your comfort goal?",
      'options': [
        "Journaling about my day",
        "Sharing gratitude",
        "Well-organized"
      ]
    }
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFD0EEFF),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: 0.8,
              widthFactor: 1.2,
              child: Transform.translate(
                offset: const Offset(-20, 0),
                child: CustomPaint(
                  painter: CurvedTopRectanglePainter(),
                  child: Container(),
                ),
              ),
            ),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: questions.length,
            itemBuilder: (context, questionIndex) {
              final question = questions[questionIndex];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      question['question'],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...List.generate(question['options'].length, (optionIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: OptionCard(
                          optionText: question['options'][optionIndex],
                        ),
                      );
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (questionIndex < questions.length - 1) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          // Handle the end of questions
                        }
                      },
                      child:
                          Text("Next", style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0XFF3B3EDE)),
                          elevation: MaterialStateProperty.all(5),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(20)),
                          shadowColor: MaterialStateProperty.all(
                              Colors.black.withOpacity(0.5))),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class OptionCard extends StatefulWidget {
  final String optionText;

  const OptionCard({Key? key, required this.optionText}) : super(key: key);

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? const Color(0XFF3B3EDE) : Color(0XFFE5E6EE),
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: ListTile(
          leading: Icon(
            isSelected ? Icons.circle : Icons.circle_outlined,
            color: isSelected ? const Color(0XFF3B3EDE) : Color(0XFFE5E6EE),
          ),
          title: Text(
            widget.optionText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
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
      ..strokeWidth = 27
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, size.height * 0.13)
      ..quadraticBezierTo(
          size.width * 0.5, -size.height * 0.13, size.width, size.height * 0.13)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final borderPath = Path()
      ..moveTo(0, size.height * 0.13)
      ..quadraticBezierTo(size.width * 0.5, -size.height * 0.13, size.width,
          size.height * 0.13);

    final shadowPath = Path()
      ..moveTo(0, size.height * 0.13 - 24)
      ..quadraticBezierTo(size.width * 0.5, -size.height * 0.13 - 24,
          size.width, size.height * 0.13 - 24)
      ..lineTo(size.width, size.height - 24)
      ..lineTo(0, size.height - 24)
      ..close();

    final shadowPaint = Paint()
      ..color = const Color.fromRGBO(59, 62, 222, 0.25)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    canvas.drawPath(shadowPath, shadowPaint);
    canvas.drawPath(path, paint);
    canvas.drawPath(borderPath, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
