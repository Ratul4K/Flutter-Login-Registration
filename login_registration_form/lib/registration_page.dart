
import 'package:flutter/material.dart';
import 'login_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration Page"),
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
                    Icons.person_add_alt_1,
                    size: 55,
                    color: Color(0xFF174C3C),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Create Your Account",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF174C3C),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // NAME FIELD
                  TextFormField(
                    controller: nameController,

                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outline),
                      labelText: "Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your name";
                      }

                      if (!RegExp(
                        r'^[a-zA-Z ]{3,}$',
                      ).hasMatch(value.trim())) {
                        return "Enter at least 3 letters";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

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

                  const SizedBox(height: 15),

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
                        return "Please create a password";
                      }

                      if (!RegExp(
                        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$',
                      ).hasMatch(value)) {
                        return "Use 8 characters with uppercase, lowercase and a number";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  // CONFIRM PASSWORD FIELD
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: hideConfirmPassword,

                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_reset),
                      labelText: "Confirm Password",

                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hideConfirmPassword = !hideConfirmPassword;
                          });
                        },

                        icon: Icon(
                          hideConfirmPassword
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
                        return "Please confirm your password";
                      }

                      if (value != passwordController.text) {
                        return "Passwords do not match";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 25),

                  // REGISTRATION BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 48,

                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,

                            MaterialPageRoute(
                              builder: (context) => LoginPage(
                                registeredEmail:
                                    emailController.text.trim(),

                                registeredPassword:
                                    passwordController.text,
                              ),
                            ),
                          );
                        }
                      },

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF174C3C),
                        foregroundColor: Colors.white,
                      ),

                      child: const Text("Register"),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // LOGIN NAVIGATION
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text(
                      "Already have an account? Login",
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
