import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nacpil_mobprog/constants.dart';
import 'package:nacpil_mobprog/widgets/custom_font.dart';
import 'package:nacpil_mobprog/widgets/custom_inkwell_button.dart';
import 'package:nacpil_mobprog/widgets/custom_textformfield.dart';

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

Widget successDialog(BuildContext context, String message, VoidCallback onOk) {
  return AlertDialog(
    title: Text('Success'),
    content: Text(message),
    actions: [
      TextButton(
        onPressed: onOk,
        child: Text('OK'),
      ),
    ],
  );
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordHidden = true;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobilenumController = TextEditingController();
  TextEditingController usernameController = TextEditingController(); 
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  // enhancement 2: create your own validation
  void register () {
    if (firstNameController.text.isEmpty || 
        lastNameController.text.isEmpty ||
        mobilenumController.text.isEmpty ||
        usernameController.text.isEmpty || 
        passwordController.text.isEmpty ||
        confirmpasswordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (_) => errorDialog(
          context,
          'All fields are required to continue.',
        ),
      );
      return;
    }

    if (passwordController.text.length < 8) {
      showDialog(
        context: context,
        builder: (_) => errorDialog(
          context,
          'Password must be at least 8 characters long.',
        ),
      );
      return;
    }

    if (!passwordController.text.contains(RegExp(r'[A-Z]'))) {
      showDialog(
        context: context,
        builder: (_) => errorDialog(
          context,
          'Password must contain at least one uppercase letter.',
        ),
      );
      return;
    }

    if (!passwordController.text.contains(RegExp(r'[a-z]'))) {
      showDialog(
        context: context,
        builder: (_) => errorDialog(
          context,
          'Password must contain at least one lowercase letter.',
        ),
      );
      return;
    }

    if (!passwordController.text.contains(RegExp(r'[0-9]'))) {
      showDialog(
        context: context,
        builder: (_) => errorDialog(
          context,
          'Password must contain at least one number.',
        ),
      );
      return;
    }

    if (!passwordController.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      showDialog(
        context: context,
        builder: (_) => errorDialog(
          context,
          'Password must contain at least one special character.',
        ),
      );
      return;
    }

    if (mobilenumController.text.length < 11 || mobilenumController.text.length > 11) {
      showDialog(
        context: context,
        builder: (_) => errorDialog(
          context,
          'Mobile number must be 11 digits long.',
        ),
      );
      return;
    }

    if (passwordController.text != confirmpasswordController.text) {
      showDialog(
        context: context,
        builder: (_) => errorDialog(
          context,
          'Passwords do not match.',
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => successDialog(
        context,
        'Registration Succesful!',
        () {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/login');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(25),
            ScreenUtil().setHeight(40),
            ScreenUtil().setWidth(25),
            ScreenUtil().setHeight(10),
          ),
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(25),
              ),
              CustomFont(
                text: 'Register Here',
                fontSize: ScreenUtil().setSp(50),
                fontWeight: FontWeight.bold,
                color: FB_DARK_PRIMARY,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(25),
              ),
              CustomTextFormField(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'First Name',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: firstNameController,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomTextFormField(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'Last Name',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: lastNameController,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomTextFormField(
                maxLength: 11,
                keyboardType: TextInputType.number,
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'Mobile Number',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: mobilenumController,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomTextFormField(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'Username',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: usernameController,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomTextFormField(
                isObscure: _isPasswordHidden,
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'Password',
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: passwordController,
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
                height: ScreenUtil().setHeight(10),
              ),
              Text(
                '(Password should be at least 8 characters, a mixture of letter and numbers consisting of at least one special character with Uppercase and Lowercase letters.)',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: ScreenUtil().setSp(10)
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomTextFormField(
                isObscure: _isPasswordHidden,
                hintText: 'Confirm Password',
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                validator: (value) => null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: confirmpasswordController,
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
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You have an account? ',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: ScreenUtil().setSp(15)
                    )),
                  GestureDetector(
                    onTap: () => Navigator.popAndPushNamed(context, '/login'),
                    child: Text(
                    'Login here',
                      style: TextStyle(
                        color: FB_DARK_PRIMARY,
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomInkwellButton(
                onTap: () => register(),
                height: ScreenUtil().setHeight(45),
                width: ScreenUtil().screenWidth,
                fontSize: ScreenUtil().setSp(15),
                fontWeight: FontWeight.bold,
                buttonName: 'Submit'
              ),
            ],
          ),
        ),
      ),
    );
  }
}