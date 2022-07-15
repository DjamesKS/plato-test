import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/validators.dart';
import 'widgets/custom_form_field.dart';
import 'widgets/rounded_button.dart';
import 'signup_page.dart';
import 'verification_page.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({Key? key}) : super(key: key);

  @override
  PhonePageState createState() => PhonePageState();
}

class PhonePageState extends State<PhonePage> {
  final _phoneFormKey = GlobalKey<FormState>();
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = const TextStyle(
        color: Color(0xff939393),
        fontSize: 14,
        fontWeight: FontWeight.w400
    );
    TextStyle linkStyle = const TextStyle(
        color: Color(0xffff5f51),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.underline
    );

    return Form(
      key: _phoneFormKey,
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
                "Your phone",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              const Text("In order to create your account we need to verify your phone number",
                style: TextStyle(
                    color: Color(0xff939393),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 38),

              const CustomFormField(
                hint: "Phone number",
                inputType: TextInputType.phone,
                borderColor: Color(0xffff9d29),
                validator: Validators.validateIfNotEmpty,
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 14.0,
                    height: 14.0,
                    child: Checkbox(
                      value: isAccepted,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isAccepted = newValue!;
                        });
                      },
                      side: const BorderSide(color: Color(0xffff9d29)),
                      activeColor: const Color(0xffff9d29)
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(style: defaultStyle, text: "I accept "),
                              TextSpan(
                                  style: linkStyle,
                                  text: "Plato Labs Terms and Conditions",
                                  recognizer: TapGestureRecognizer()..onTap = () {
                                    // show Plato Labs Terms and Conditions
                                  }
                              )
                            ]
                        )
                    ),
                  ),
                ],
              ),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      if (_phoneFormKey.currentState!.validate()) {
                        if (!isAccepted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please accept Plato Labs Terms and Conditions')),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                              VerificationPage(isByPhone: true, nextPage: () {return const SignUpPage();})),
                          );
                      }
                      }
                    },
                    child: const RoundedButton(
                      width: 332.0,
                      height: 54.0,
                      text: "Next",
                      color: Color(0xffff9d29),
                      textColor: Colors.white
                    )
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
