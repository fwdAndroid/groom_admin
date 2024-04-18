import 'package:flutter/material.dart';
import 'package:groom_admin/database/auth_methods.dart';
import 'package:groom_admin/screens/auth/forgot_password.dart';
import 'package:groom_admin/screens/auth/signup_account.dart';
import 'package:groom_admin/screens/home_page.dart';
import 'package:groom_admin/utils/app_colors.dart';
import 'package:groom_admin/utils/app_style.dart';
import 'package:groom_admin/utils/buttons.dart';
import 'package:groom_admin/utils/colors.dart';
import 'package:groom_admin/utils/input_text.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                _FormSection(),
                _ImageSection(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _FormSection extends StatefulWidget {
  const _FormSection({Key? key}) : super(key: key);

  @override
  State<_FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<_FormSection> {
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
    return Container(
      color: AppColors.neutral,
      width: 448,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Log in",
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
                icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off),
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
          const SizedBox(height: 30),
          _isLoading
              ? CircularProgressIndicator()
              : SaveButton(
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

                      String res = await AuthMethods().loginUpUser(
                        email: _emailController.text,
                        pass: _passwordController.text,
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
                                builder: (builder) => HomePage()));
                      }
                    }
                  }),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 400,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => SignUpAccount()));
                    },
                    child: Text(
                      "Create New Admin Account",
                      style: GoogleFonts.dmSans(
                          color: mainBtnColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ),
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
                              builder: (builder) => ForgotPassword()));
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
        ],
      ),
    );
  }
}

class _ImageSection extends StatelessWidget {
  const _ImageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/logo.png",
            height: 300,
          ))
        ],
      ),
    );
  }
}
