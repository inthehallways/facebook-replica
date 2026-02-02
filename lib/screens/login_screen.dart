import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/custom_inkwell_button.dart';

Widget errorDialog(BuildContext context, String message) {
  return AlertDialog(
    title: Text('Error'),
    content: Text(message),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('OK'),
      ),
    ],
  );
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordHidden = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_DARK_PRIMARY,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(25),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/NUCCITLogo_Black.png',
                        height: ScreenUtil().setHeight(200),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(30),
                      ),
                      CustomTextFormField(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        controller: usernameController,
                        validator: (value) => 
                          value!.isEmpty ? 'Enter your username' : null,
                        onSaved: (value) => usernameController = value!,
                        fontSize: ScreenUtil().setSp(15),
                        fontColor: FB_DARK_PRIMARY,
                        hintTextSize: ScreenUtil().setSp(15),
                        hintText: 'Username'
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(10),
                      ),
                      CustomTextFormField(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        controller: passwordController,
                        isObscure: _isPasswordHidden,
                        validator: (value) =>
                          value!.isEmpty ? 'Enter your password' : null,
                        onSaved: (value) => passwordController = value!,
                        fontSize: ScreenUtil().setSp(15),
                        fontColor: FB_DARK_PRIMARY,
                        hintTextSize: ScreenUtil().setSp(15),
                        hintText: 'Password',
                        suffixIcon: IconButton( // enhancement 1: show/hide password
                          icon: Icon(
                            _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordHidden = !_isPasswordHidden;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(50)
                      ),
                      CustomInkwellButton(
                        onTap: () {
                          if(usernameController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                            showDialog(
                              context: context,
                              builder: (_) => errorDialog(
                                context,
                                'Username and Password are required.',
                              ),
                            );
                            return;
                          }
                          Navigator.pushReplacementNamed(
                            context, '/home',
                            arguments: {'username': usernameController.text}, // passing username to home screen
                          );
                        },
                        height: ScreenUtil().setHeight(40),
                        width: ScreenUtil().screenWidth,
                        buttonName: 'Login',
                        fontSize: ScreenUtil().setSp(15),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_DARK_PRIMARY,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('You do not have an account? ',
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: ScreenUtil().setSp(15)
                        )),
                      GestureDetector(
                        onTap: () => Navigator.popAndPushNamed(
                          context, '/register'
                        ),
                        child: Text(
                          'Register here',
                          style: TextStyle(
                            color: FB_LIGHT_PRIMARY,
                            fontSize: ScreenUtil().setSp(15),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}