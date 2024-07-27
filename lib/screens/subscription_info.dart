// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Subscription',
          style: TextStyle(fontFamily: 'Euclid Circular A', fontSize: 16),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Spacer(),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo-sample.png',
                    width: 106,
                    height: 88,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'One Step At a Time',
                    style: TextStyle(
                      fontFamily: 'Euclid Circular A',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: 342,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildRow(
                      'Plan Type', 'PRO', 'assets/subinfo_icons/plan.png'),
                  SizedBox(
                    width: 318,
                    height: 16,
                    child: Divider(),
                  ),
                  _buildRow('Duration', 'Monthly',
                      'assets/subinfo_icons/duration.png'),
                  SizedBox(
                    width: 318,
                    height: 16,
                    child: Divider(),
                  ),
                  _buildRow('Status', '', 'assets/subinfo_icons/status.png',
                      isSwitch: true),
                  SizedBox(
                    width: 318,
                    height: 16,
                    child: Divider(),
                  ),
                  _buildRow('Renewal Date', '12 Aug 2024',
                      'assets/subinfo_icons/renewal.png'),
                  SizedBox(
                    width: 318,
                    height: 16,
                    child: Divider(),
                  ),
                  _buildRow(
                      'Amount', 'Rs. 500', 'assets/subinfo_icons/amount.png'),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Add your cancel subscription logic here
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE94444),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  minimumSize: Size(312, 56)),
              child: Text(
                'Cancel Subscription',
                style: TextStyle(
                  fontFamily: 'Euclid Circular A',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, String subinfo,
      {bool isSwitch = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(subinfo),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Euclid Circular A',
                fontSize: 14,
              ),
            ),
          ],
        ),
        isSwitch
            ? Switch(
                value: true,
                onChanged: (bool newValue) {},
                activeColor: Color.fromARGB(255, 120, 179, 137),
              )
            : Text(
                value,
                style: GoogleFonts.lato(
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
      ],
    );
  }
}
