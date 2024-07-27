// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
            Navigator.pushReplacementNamed(context, '/main', arguments: 3);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildTextField(context, 'Username', 'Enter Your Username'),
            buildTextField(context, 'Email', 'Enter Your Email'),
            buildPasswordField(
                context, 'Old Password', 'Place the password here'),
            buildPasswordField(
                context, 'New Password', 'Place the password here'),
            buildPasswordField(
                context, 'Confirm Password', 'Place the password here'),
            buildPasswordField(
                context, 'Verify with OTP', 'Place the password here'),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context, labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle:
                  Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPasswordField(
      BuildContext context, labelText, String placeholder) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle:
                  Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              suffixIcon: Icon(
                Icons.visibility_off,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
