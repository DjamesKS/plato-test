import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/validators.dart';
import 'widgets/custom_form_field.dart';
import 'widgets/rounded_button.dart';

typedef CustomCallBack = Widget Function();

class VerificationPage extends StatefulWidget {
  final bool isByPhone;
  final CustomCallBack? nextPage;

  const VerificationPage({super.key, required this.isByPhone, this.nextPage});

  @override
  VerificationPageState createState() => VerificationPageState();
}

class VerificationPageState extends State<VerificationPage> {
  final _verificationFormKey = GlobalKey<FormState>();
  String _caption = "";
  String _text = "";
  String _hint = "";
  String _resendQuestion = "";

  @override
  void initState() {
    super.initState();

    if (widget.isByPhone) {

      _caption = "Verification";
      _text = "You just received a code on your phone. Use this code to confirm "
          "your identity";
      _hint = "Verfication code";
      _resendQuestion = "Didn't get the message?";

    } else {

      _caption = "Activation code";
      _text = "Check your email. You just received an email with the activation "
          "code for your account.";
      _hint = "Activation code";
      _resendQuestion = "Didn't get the mail?";

    }
  }

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
      key: _verificationFormKey,
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

              Text(_caption,
                style: Theme.of(context).textTheme.headlineMedium
              ),
              const SizedBox(height: 5),

              Text(_text,
                style: defaultStyle
              ),
              const SizedBox(height: 38),

              CustomFormField(
                hint: _hint,
                borderColor: Theme.of(context).primaryColorLight,
                validator: Validators.validateIfNotEmpty,
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(style: defaultStyle, text: "$_resendQuestion "),
                        TextSpan(
                          style: linkStyle,
                          text: "Resend code",
                          recognizer: TapGestureRecognizer()..onTap = () {
                            // code resending logic here
                          }
                        )
                      ]
                    )
                  ),
                ],
              ),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      if (_verificationFormKey.currentState!.validate()) {
                        if (widget.nextPage != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => widget.nextPage!()),
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
