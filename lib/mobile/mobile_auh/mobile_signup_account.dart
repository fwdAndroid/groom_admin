import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groom_admin/database/auth_methods.dart';
import 'package:groom_admin/mobile/mobile_auh/mobile_sign_in.dart';
import 'package:groom_admin/mobile/mobile_home_page.dart';
import 'package:groom_admin/utils/app_style.dart';
import 'package:groom_admin/utils/buttons.dart';
import 'package:groom_admin/utils/colors.dart';
import 'package:groom_admin/utils/input_text.dart';

class MobileSignUpAccount extends StatefulWidget {
  const MobileSignUpAccount({super.key});

  @override
  State<MobileSignUpAccount> createState() => _MobileSignUpAccountState();
}

class _MobileSignUpAccountState extends State<MobileSignUpAccount> {
  bool passwordVisible = false;
  TextEditingController _nameController = TextEditingController();
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorwhite),
        backgroundColor: Colors.blue,
        title: Text(
          "Sign Up Account",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "First Name",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              const SizedBox(height: 9),
              InputText(
                controller: _nameController,
                labelText: "First Name",
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {},
                onSaved: (val) {},
                textInputAction: TextInputAction.done,
                isPassword: false,
                enabled: true,
              ),
              const SizedBox(height: 9),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email Address",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              const SizedBox(height: 9),
              InputText(
                controller: _emailController,
                labelText: "example@gmail.com",
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {},
                onSaved: (val) {},
                textInputAction: TextInputAction.done,
                isPassword: false,
                enabled: true,
              ),
              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              const SizedBox(height: 9),
              TextFormField(
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
              const SizedBox(
                height: 10,
              ),
              _isLoading
                  ? CircularProgressIndicator()
                  : SaveButton(
                      color: mainBtnColor,
                      title: "Continue",
                      onTap: () async {
                        if (_nameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("First Name  is Required")));
                        } else if (_emailController.text.isEmpty ||
                            _passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Email or Password is Required")));
                        } else {
                          setState(() {
                            _isLoading = true;
                          });
                        }

                        String res = await AuthMethods().signUpUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                          confirmPassword: _passwordController.text,
                          firstName: _nameController.text,
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
                      }),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => MobileSignIn()));
                },
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: GoogleFonts.dmSans(
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign I',
                        style: GoogleFonts.dmSans(
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'n\n',
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
      ),
    );
  }
}
