import 'package:flutter/material.dart';
import 'package:fonepay_flutter/fonepay_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String refId = '';
  String hasError = '';
  String selectedPlan = 'Monthly'; // Initialize the selected plan

  @override
  void initState() {
    super.initState();
    _loadSelectedPlan();
  }

  Future<void> _loadSelectedPlan() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedPlan = prefs.getString('selectedPlan') ?? 'Monthly';
    });
  }

  Future<void> _saveSelectedPlan(String plan) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedPlan', plan);
  }

  void successPage() {
    Navigator.pushReplacementNamed(context, '/subscription');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3B3EDE),
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/main');
          },
        ),
      ),
      backgroundColor: const Color(0xff3B3EDE),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Container(
                child: Image.asset('assets/icons/payment-icons.png'),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Invest in a happy brain',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.24,
              ),
            ),
            const SizedBox(height: 24),
            Column(
              children: const [
                Text(
                  '7x increase in focus',
                  style: TextStyle(
                    color: Color(0xFFFBFEFB),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.17,
                  ),
                ),
                Text(
                  '3.6x decrease in stress',
                  style: TextStyle(
                    color: Color(0xFFFBFEFB),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.17,
                  ),
                ),
                Text(
                  'Developed with wellness habits',
                  style: TextStyle(
                    color: Color(0xFFFBFEFB),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.17,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPlan = 'Annual';
                });
                _saveSelectedPlan('Annual');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: selectedPlan == 'Annual'
                      ? const Color(0xffD0F1FF)
                      : const Color(0x33E5E6EE),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: selectedPlan == 'Annual'
                        ? Colors.black
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Annual',
                          style: TextStyle(
                            color: selectedPlan == 'Annual'
                                ? const Color(0xFF0D1B1E)
                                : const Color(0xFFE5E6EE),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.24,
                          ),
                        ),
                        Container(
                          width: 85,
                          height: 26,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: ShapeDecoration(
                            color: const Color(0xFF78B389),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Best value',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'First 30 days free - Then NPR 5k/Year',
                      style: TextStyle(
                        color: selectedPlan == 'Annual'
                            ? const Color(0xFF0D1B1E)
                            : const Color(0xFFE5E6EE),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPlan = 'Monthly';
                });
                _saveSelectedPlan('Monthly');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: selectedPlan == 'Monthly'
                      ? const Color(0xffD0F1FF)
                      : const Color(0x33E5E6EE),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: selectedPlan == 'Monthly'
                        ? Colors.black
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Monthly',
                          style: TextStyle(
                            color: selectedPlan == 'Monthly'
                                ? const Color(0xFF0D1B1E)
                                : const Color(0xFFE5E6EE),
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'First 7 days free - Then NPR 500/Month',
                      style: TextStyle(
                        color: selectedPlan == 'Monthly'
                            ? const Color(0xFF0D1B1E)
                            : const Color(0xFFE5E6EE),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                final result = await FonePay.i.init(
                    context: context,
                    fonePayConfig: FonePayConfig.dev(
                      ru: 'https://www.marvel.com/hello',
                      prn: 'PD-2-${FonePayUtils.generateRandomString(len: 2)}',
                      amt: selectedPlan == 'monthly' ? 500.0 : 5000,
                      r1: 'qwq',
                      r2: 'https://www.marvel.com/hello',
                    ));
                if (result.hasData) {
                  final response = result.data!;
                  setState(() {
                    hasError = '';
                    refId = response.uid!;
                  });
                  if (kDebugMode) {
                    print(response.toJson());
                  }
                  await _saveSelectedPlan(selectedPlan);
                  successPage();
                } else {
                  setState(() {
                    refId = '';
                    hasError = result.error!;
                  });
                  if (kDebugMode) {
                    print(result.error);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFBFEFB),
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Container(
                width: 300,
                height: 45,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: ShapeDecoration(
                  color: Color(0xFFFBFEFB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Start 7-day free trial',
                      style: TextStyle(
                        color: Color(0xFF3B3EDE),
                        fontSize: 14,
                        fontFamily: 'Euclid Circular A',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'By placing this order, you agree to the ',
                      style: TextStyle(
                        color: Color(0xFFD8D9DB),
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.12,
                      ),
                    ),
                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                        color: Color(0xFFFFD400),
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.12,
                      ),
                    ),
                    TextSpan(
                      text: ' and ',
                      style: TextStyle(
                        color: Color(0xFFD8D9DB),
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.12,
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: Color(0xFFFFD400),
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.12,
                      ),
                    ),
                    TextSpan(
                      text:
                          '. Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period.',
                      style: TextStyle(
                        color: Color(0xFFD8D9DB),
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.12,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
