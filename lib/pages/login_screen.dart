import 'package:first_project/pages/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _phoneNumber;
  bool _isLoading = false;
  Future<void> sendOtp(String phoneNumber) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 71, 69, 69),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    "assets/images/undraw_secure-login_m11a.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Continue with",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 71, 69, 69),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text(
                    "Google",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 74, 142, 197),
                    ),
                  ),
                  icon: const Icon(
                    FontAwesomeIcons.google,
                    size: 35,
                    color: Color.fromARGB(255, 74, 142, 197),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(380, 50),
                    backgroundColor: const Color.fromARGB(255, 212, 210, 210),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text(
                    "Facebook",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 74, 142, 197),
                    ),
                  ),
                  icon: const Icon(
                    FontAwesomeIcons.facebook,
                    size: 35,
                    color: Color.fromARGB(255, 74, 142, 197),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(380, 50),
                    backgroundColor: const Color.fromARGB(255, 212, 210, 210),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text(
                    "Twitter",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 74, 142, 197),
                    ),
                  ),
                  icon: const Icon(
                    FontAwesomeIcons.twitter,
                    size: 35,
                    color: Color.fromARGB(255, 74, 142, 197),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(380, 50),
                    backgroundColor: const Color.fromARGB(255, 212, 210, 210),
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  "━━━━ Or ━━━━",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Enter your mobile number",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: "Mobile number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    initialCountryCode: "IN",
                    onChanged: (phone) {
                      _phoneNumber = phone.completeNumber;
                    },
                    validator: (phone) {
                      if (phone == null || phone.number.isEmpty) {
                        return 'Please enter a valid mobile number';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => _isLoading = true);

                            try {
                              await sendOtp(_phoneNumber!);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpScreen(),
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Failed to send OTP. Try again later.'),
                                ),
                              );
                            } finally {
                              setState(() => _isLoading = false);
                            }
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 81, 79, 79),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Continue",
                          style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
