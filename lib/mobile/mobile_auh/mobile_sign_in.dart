import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groom_admin/database/auth_methods.dart';
import 'package:groom_admin/mobile/mobile_auh/mobile_forgot_password.dart';
import 'package:groom_admin/mobile/mobile_auh/mobile_signup_account.dart';
import 'package:groom_admin/mobile/mobile_home_page.dart';
import 'package:groom_admin/utils/app_style.dart';
import 'package:groom_admin/utils/buttons.dart';
import 'package:groom_admin/utils/colors.dart';
import 'package:groom_admin/utils/input_text.dart';

class MobileSignIn extends StatefulWidget {
  const MobileSignIn({super.key});

  @override
  State<MobileSignIn> createState() => _MobileSignInState();
}

class _MobileSignInState extends State<MobileSignIn> {
  bool passwordVisible = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                "assets/logo.png",
                height: 200,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: InputText(
                controller: _emailController,
                labelText: "example@gmail.com",
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {},
                onSaved: (val) {},
                textInputAction: TextInputAction.done,
                isPassword: false,
                enabled: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _passwordController,
                obscureText: passwordVisible,
                decoration: InputDecoration(
                  focusedBorder: AppStyles.focusedBorder,
                  disabledBorder: AppStyles.focusBorder,
                  enabledBorder: AppStyles.focusBorder,
                  errorBorder: AppStyles.focusErrorBorder,
                  focusedErrorBorder: AppStyles.focusErrorBorder,
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                  alignLabelWithHint: false,
                  filled: true,
                ),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
              ),
            ),
            const SizedBox(height: 30),
            _isLoading
                ? CircularProgressIndicator()
                : SaveButton(
                    color: mainBtnColor,
                    title: "Login",
                    onTap: () async {
                      if (_emailController.text.isEmpty ||
                          _passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Email or Password is Required")));
                      } else {
                        setState(() {
                          _isLoading = true;
                        });

                        String res = await AuthMethods().loginUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );

                        setState(() {
                          _isLoading = false;
                        });
                        if (res != 'sucess') {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(res)));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => MobileHomePage()));
                        }
                      }
                    }),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.only(right: 25),
                child: SizedBox(
                  width: 154,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => MobileForgotPassword()));
                      },
                      child: Text(
                        "Forgot Password",
                        style: GoogleFonts.dmSans(
                            color: mainBtnColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => MobileSignUpAccount()));
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Want To Create New Admin Account?",
                      style: GoogleFonts.dmSans(
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: '\n Click Here',
                      style: GoogleFonts.dmSans(
                        color: black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
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
