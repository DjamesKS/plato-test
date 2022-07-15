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
    TextStyle defaultStyle = Theme.of(context).textTheme.labelMedium!;
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

              Text(
                "Your phone",
                style: Theme.of(context).textTheme.headlineMedium
              ),
              const SizedBox(height: 5),

              Text("In order to create your account we need to verify your phone number",
                style: defaultStyle
              ),
              const SizedBox(height: 38),

              CustomFormField(
                hint: "Phone number",
                inputType: TextInputType.phone,
                borderColor: Theme.of(context).primaryColorLight,
                validator: Validators.validateIfNotEmpty
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
                      side: BorderSide(color: Theme.of(context).primaryColorLight),
                      activeColor: Theme.of(context).primaryColorLight
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
                    child: RoundedButton(
                      width: 332.0,
                      height: 54.0,
                      text: "Next",
                      color: Theme.of(context).primaryColorLight,
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
