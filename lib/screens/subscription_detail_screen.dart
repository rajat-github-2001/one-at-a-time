import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  Future<Map<String, String>> _loadSubscriptionDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final planType = prefs.getString('selectedPlan') ?? 'Monthly';
    return {
      'planType': planType,
      'duration': planType == 'Monthly' ? 'Monthly' : 'Annual',
      'renewalDate': planType == 'Monthly' ? '30 Aug 2024' : '29 July 2025',
      'amount': planType == 'Monthly' ? 'Rs. 500' : 'Rs. 5000',
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Subscription',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, String>>(
        future: _loadSubscriptionDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
                child: Text('Error loading subscription details'));
          } else {
            final subscriptionDetails = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      Image.asset('assets/images/logo-sample.png'),
                      const SizedBox(height: 20),
                      const Text(
                        'One Step At a Time',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.upload_outlined),
                                SizedBox(
                                  width: 5,
                                ),
                                const Text('Plan type: ',
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            Text(subscriptionDetails['planType']!,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.calendar_today_outlined),
                                SizedBox(
                                  width: 5,
                                ),
                                const Text('Duration: ',
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            Text(subscriptionDetails['duration']!,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.play_circle_fill_outlined),
                                SizedBox(
                                  width: 5,
                                ),
                                const Text('Status: ',
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            Switch(value: true, onChanged: (_) {}),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.switch_access_shortcut),
                                SizedBox(
                                  width: 5,
                                ),
                                const Text('Renew date: ',
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            Text(subscriptionDetails['renewalDate']!,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.money),
                                SizedBox(
                                  width: 5,
                                ),
                                const Text('Amount: ',
                                    style: TextStyle(fontSize: 16)),
                              ],
                            ),
                            Text(subscriptionDetails['amount']!,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      // Add your cancel subscription logic here
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0),
                    child: Container(
                      width: 300,
                      height: 45,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      decoration: ShapeDecoration(
                        color: Colors.red,
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
                            'Cancel Subscription',
                            style: TextStyle(
                              color: Colors.white,
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
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
