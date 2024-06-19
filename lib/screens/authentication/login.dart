import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _passwordController = TextEditingController();
  bool _passwordObscured = true;
  bool _rememberMe = false;

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
              'Welcome Back!',
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
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 37, vertical: 22))),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
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
                    padding: const EdgeInsets.symmetric(horizontal: 12),
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
            Container(
              margin: EdgeInsets.only(top: 16, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _rememberMe = !_rememberMe;
                            });
                          },
                          child: Icon(
                            _rememberMe
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                            color: _rememberMe ? Color(0XFF3B3EDE) : Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Remember Me',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ])),
                  TextButton(
                      onPressed: () {},
                      child:const Text(
                        'Forgot your password?',
                        style: TextStyle(
                          color: Color(0XFF3B3EDE),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/profile');
                },
                label: const Text(
                  'Login',
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
            const SizedBox(
              height: 42,
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
                  "Don't have an account yet?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  child: const Text(
                    'Sign up',
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
      ),
    );
  }
}
