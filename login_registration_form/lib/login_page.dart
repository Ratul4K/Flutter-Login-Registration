
import 'package:flutter/material.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  final String? registeredEmail;
  final String? registeredPassword;

  const LoginPage({
    super.key,
    this.registeredEmail,
    this.registeredPassword,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 380,
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Form(
              key: formKey,

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.lock_outline,
                    size: 55,
                    color: Color(0xFF174C3C),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF174C3C),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // EMAIL FIELD
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,

                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      labelText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your email";
                      }

                      if (!RegExp(
                        r'^[\w.%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      ).hasMatch(value.trim())) {
                        return "Enter a valid email address";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 18),

                  // PASSWORD FIELD
                  TextFormField(
                    controller: passwordController,
                    obscureText: hidePassword,

                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      labelText: "Password",

                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },

                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  // LOGIN BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 48,

                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (widget.registeredEmail != null &&
                              emailController.text.trim() ==
                                  widget.registeredEmail &&
                              passwordController.text ==
                                  widget.registeredPassword) {

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login successful!"),
                              ),
                            );

                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Invalid email or password"),
                              ),
                            );
                          }
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF174C3C),
                        foregroundColor: Colors.white,
                      ),

                      child: const Text("Login"),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // REGISTRATION NAVIGATION
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegistrationPage(),
                        ),
                      );
                    },

                    child: const Text(
                      "Don't have an account? Register",
                      style: TextStyle(
                        color: Color(0xFF174C3C),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
