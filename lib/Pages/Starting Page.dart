import 'package:coop/Constants/constants.dart';
import 'package:coop/Pages/Homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class startPage extends StatefulWidget {
  @override
  _startPageState createState() => _startPageState();
}

class _startPageState extends State<startPage> {
  GlobalKey<FormState> signinForm = GlobalKey();
  GlobalKey<FormState> signupForm = GlobalKey();

  FocusNode passFocusNode = FocusNode();
  FocusNode userNameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode confirmPassFocusNode = FocusNode();
  // FocusNode userNameFocusNode = FocusNode();

  bool accountExist = true;

  TextStyle titleLeading = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 20, color: Colors.grey.shade400);
  TextStyle labelhint = TextStyle(color: Colors.grey.shade300);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 24.0,
            ),
            alignment: Alignment.topCenter,
            color: coopPrimaryColor,
            width: MediaQuery.of(context).size.width * 0.8,
            child: (Image.asset(coopWhiteLogo)),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.02,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: coopPrimaryColor,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  Container(
                    child: Text(
                      "We are proud to be a home to more than 8 million"
                      " customers worldwide offering Retail, Cooperative, "
                      "Institutional and Diaspora.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          height: 1.2,
                          color: coopMaterialColor.shade100),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: accountExist ? SignInCard() : SignUpCard()),
          // SignInCard(),
        ],
      ),
    );
  }

  Widget SignInCard() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.22),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: signinForm,
            child: Card(
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Sign In",
                      style: titleLeading,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    TextFormField(
                      focusNode: userNameFocusNode,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'User Name',
                        prefixIcon: Icon(userNameFocusNode.hasFocus
                            ? Icons.person
                            : Icons.person_outline),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      focusNode: passFocusNode,
                      validator: (input) {
                        if (input!.length < 6)
                          return 'Provide Minimum 6 Character';
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'Password',
                        prefixIcon: Icon(passFocusNode.hasFocus
                            ? Icons.lock
                            : Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: _showPassword,
                        ),
                      ),
                      obscureText: _obscureText,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot password?',
                              style:
                                  TextStyle(color: coopMaterialColor.shade200),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (signinForm.currentState!.validate()) {
                          Get.to(HomePage());
                        }
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 56)),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("You don't have an account?"),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                accountExist = false;
                              });
                            },
                            child: Text(
                              'Signup',
                              style:
                                  TextStyle(color: coopMaterialColor.shade200),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _obscureText = true;
  TextEditingController passwordController = TextEditingController();
  void _showPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget SignUpCard() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.22, bottom: 100),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: signupForm,
            child: Card(
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Sign Up", style: titleLeading),
                    SizedBox(
                      height: 24.0,
                    ),
                    TextFormField(
                      focusNode: userNameFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Milkesa Gebi',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'Full Name',
                        prefixIcon: userNameFocusNode.hasFocus
                            ? Icon(Icons.person)
                            : Icon(Icons.person_outline),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      focusNode: phoneFocusNode,
                      validator: (input) {
                        bool phoneValid =
                            RegExp(r'^[0-9]{9}$').hasMatch(input!);
                        if (!phoneValid)
                          return "Phone must be Exactly 9 digits";
                        else
                          return null;
                      },
                      decoration: InputDecoration(
                        // hintText: '---------',
                        prefix: Text('+251 '),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'Phone number',
                        prefixIcon: phoneFocusNode.hasFocus
                            ? Icon(Icons.phone)
                            : Icon(Icons.phone_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      focusNode: emailFocusNode,
                      validator: (valid) {
                        var email = valid.toString();
                        bool emailValid = RegExp(
                                r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                            .hasMatch(email);
                        if (emailValid) {
                          email = '${valid.toString()}';
                          return null;
                        } else
                          return 'Invalid Email';
                      },
                      decoration: InputDecoration(
                        hintText: 'milk21@gmail.com',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'Email',
                        prefixIcon: emailFocusNode.hasFocus
                            ? Icon(Icons.email)
                            : Icon(Icons.email_outlined),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      focusNode: passFocusNode,
                      controller: passwordController,
                      validator: (input) {
                        if (input!.length < 6)
                          return 'Provide Minimum 6 Character';
                      },
                      decoration: InputDecoration(
                        // hintText: 'Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'Password',
                        prefixIcon: passFocusNode.hasFocus
                            ? Icon(Icons.lock)
                            : Icon(Icons.lock_outlined),
                      ),
                      obscureText: _obscureText,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      focusNode: confirmPassFocusNode,
                      validator: (input) {
                        if (input != passwordController.text)
                          return "Password Doesn't match";
                      },
                      decoration: InputDecoration(
                        // hintText: 'Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        labelText: 'Confirm Password',
                        prefixIcon: confirmPassFocusNode.hasFocus
                            ? Icon(Icons.lock)
                            : Icon(Icons.lock_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: _showPassword,
                        ),
                      ),
                      obscureText: _obscureText,
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (signupForm.currentState!.validate()) {
                          Get.to(HomePage());
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 56)),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Already have an account?"),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                accountExist = true;
                              });
                            },
                            child: Text(
                              'Sign In',
                              style:
                                  TextStyle(color: coopMaterialColor.shade200),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
