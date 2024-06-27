import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _passwordController = TextEditingController();
  bool _passwordObscured = true;
  bool _agree = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-0.18, -0.98),
          end: Alignment(0.18, 0.98),
          colors: [
            Color(0xFFD0EEFF),
            Color(0xFFC4ECFB),
            Color(0xFFB9EBF6),
            Color(0xFFAFE9EE),
            Color(0xFFA7E7E4),
            Color(0xFFA2E4D9),
            Color(0xFFA0E1CC),
            Color(0xFFA2DDBE),
            Color(0xFFA6D9AF),
            Color(0xFFADD4A0)
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 62,
          ),
          const Text(
            'Start your journey!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF0D1B1E),
              fontWeight: FontWeight.w700,
              fontSize: 30,
              letterSpacing: 1.50,
            ),
          ),
          const SizedBox(
            height: 46,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/google-logo.png',
                fit: BoxFit.contain,
              ),
              label: const Text(
                'Continue with Google',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0XFFFBFEFB)),
                  elevation: MaterialStateProperty.all(5),
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      horizontal: 37, vertical: 22))),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Or',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0XFF0D1B1E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            margin: EdgeInsets.only(top: 12, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('E-mail',
                    style: TextStyle(
                      color: Color(0XFF898D9E),
                      fontSize: 14,
                    )),
                const SizedBox(
                  height: 4,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0XFFFBFEFB),
                    contentPadding: EdgeInsets.all(15),
                    hintText: "Enter your e-mail here",
                    hintStyle:
                        const TextStyle(color: Color(0XFF898D9E), fontSize: 14),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Icon(
                        Icons.mail_outline,
                        color: Color(0XFF898D9E),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Username',
                    style: TextStyle(
                      color: Color(0XFF898D9E),
                      fontSize: 14,
                    )),
                const SizedBox(
                  height: 4,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0XFFFBFEFB),
                    contentPadding: EdgeInsets.all(15),
                    hintText: "Type in your username",
                    hintStyle:
                        TextStyle(color: Color(0XFF898D9E), fontSize: 14),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        Icons.account_circle_outlined,
                        color: Color(0XFF898D9E),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Password',
                    style: TextStyle(
                      color: Color(0XFF898D9E),
                      fontSize: 14,
                    )),
                const SizedBox(
                  height: 4,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0XFFFBFEFB),
                    contentPadding: EdgeInsets.all(15),
                    hintText: "Place the password here",
                    hintStyle:
                        TextStyle(color: Color(0XFF898D9E), fontSize: 14),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        Icons.lock_outline,
                        color: Color(0XFF898D9E),
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _passwordObscured = !_passwordObscured;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Icon(
                          _passwordObscured
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Color(0XFF898D9E),
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                  ),
                  obscureText: _passwordObscured,
                ),
              ],
            ),
          ),
          const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton.icon(
                onPressed: () {},
                label: const Text(
                  'Sign up',
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
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0XFF3B3EDE)),
                  elevation: MaterialStateProperty.all(5),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                  ),
                  shadowColor: MaterialStateProperty.all(
                      const Color(0XFF3B3EDE).withOpacity(0.20)),
                ),
              ),
            ),
            const SizedBox(height: 42,),
            Container(
              margin: EdgeInsets.only(top: 16, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _agree = !_agree;
                      });
                    },
                    child: Icon(
                      _agree ? Icons.check_box :
                      Icons.check_box_outline_blank,
                      color: _agree ? Color(0XFF3B3EDE) : Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8,),
                  const Flexible(
                    child: Text(
                      'By continuing you accept our Privacy Policy and Term of Use',
                      style: TextStyle(
                            color: Color(0XFF0D1B1E),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0XFF3B3EDE),
                    ),
                  ),
                ),
              ],
            ) 
        ],
      ),
    ));
  }
}
