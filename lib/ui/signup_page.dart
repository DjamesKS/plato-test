import 'package:flutter/material.dart';

import '../utils/validators.dart';
import 'widgets/custom_form_field.dart';
import 'widgets/rounded_button.dart';
import 'verification_page.dart';
import 'welcome_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final _signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signUpFormKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 65.0, right: 25.0, bottom: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40.92,
                height: 61.46,
                decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/logo.png"),
                        fit: BoxFit.contain)
                ),
              ),
              const SizedBox(height: 15),

              const Text(
                "Sign up",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 23),

              const CustomFormField(
                iconName: "account_circle",
                hint: "Name",
                borderColor: Color(0xffff9d29),
                validator: Validators.validateIfNotEmpty,
              ),

              const SizedBox(height: 17),

              const CustomFormField(
                iconName: "mail",
                hint: "Email",
                borderColor: Color(0xffcfcfcf),
                inputType: TextInputType.emailAddress,
                validator: Validators.validateEmail
              ),

              const SizedBox(height: 17),

              const CustomFormField(
                iconName: "pin_drop",
                hint: "Address",
                borderColor: Color(0xffcfcfcf),
                validator: Validators.validateIfNotEmpty
              ),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      if (_signUpFormKey.currentState!.validate()) {
                        // for testing convenience just navigating to the first page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>
                            VerificationPage(isByPhone: false, nextPage: () {return const WelcomePage();})),
                        );
                      }
                    },
                    child: const RoundedButton(
                      width: 332.0,
                      height: 54.0,
                      text: "Next",
                      color: Color(0xffff9d29),
                      textColor: Colors.white
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
