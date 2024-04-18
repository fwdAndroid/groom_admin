import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groom_admin/mobile/mobile_auh/mobile_sign_in.dart';
import 'package:groom_admin/utils/buttons.dart';
import 'package:groom_admin/utils/input_text.dart';

class MobileForgotPassword extends StatefulWidget {
  const MobileForgotPassword({super.key});

  @override
  State<MobileForgotPassword> createState() => _MobileForgotPasswordState();
}

class _MobileForgotPasswordState extends State<MobileForgotPassword> {
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
                child: Image.asset(
              "assets/logo.png",
              height: 300,
            )),
            const Text(
              "Forgot Password",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.63),
            ),
            const SizedBox(height: 41),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email Address",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            const SizedBox(height: 9),
            InputText(
              controller: _passwordController,
              labelText: "example@gmail.com",
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) {},
              onSaved: (val) {},
              textInputAction: TextInputAction.done,
              isPassword: false,
              enabled: true,
            ),
            const SizedBox(height: 30),
            _isLoading
                ? CircularProgressIndicator()
                : SaveButton(
                    title: "Send",
                    onTap: () async {
                      if (_passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Email is Required To reset the password")));
                      } else {
                        setState(() {
                          _isLoading = true;
                        });

                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: _passwordController.text.trim());

                        setState(() {
                          _isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Reset Password Link Send to your email")));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => MobileSignIn()));
                      }
                    })
          ],
        ),
      ),
    );
  }
}
