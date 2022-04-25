import 'package:flutter/material.dart';
import 'package:ss_skin_project/LogInScreen.dart';
import 'Constants.dart';
import 'dbOperations.dart';

// class for the reset password screen
class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool emailNotFound = false;

  static const screenColor = Constants.cyan2;//Constants.teal; //Constants.tealAccent;
  static const buttonColor = Constants.white;// Constants.cyan; // Constants.cyan;
  static const textColor = Colors.black;
  static const titleColor = textColor;


  /*
  //Disgusting Combination of Colors
  static const screenColor = Colors.white;
  static const buttonColor = Constants.amber;
  static const textColor = Colors.green;
  static const titleColor = Colors.green;

   */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
        appBar: AppBar(
          title: const Text('Skin Safety Scanner',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: textColor,
            )
          ),
          centerTitle: true,
          backgroundColor: screenColor,
          iconTheme: const IconThemeData(
            color: textColor,
          )
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                child: const Text(
                  'Reset Password\n',
                  style: TextStyle(
                      color: titleColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 34),
                )
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                    "Enter below.",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                        fontSize: 20
                    )
                )
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                style: const TextStyle(
                  color: textColor,
                ),
                decoration: const InputDecoration(
                  fillColor: Constants.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: textColor
                      )
                  ),
                  labelText: 'Email',
                ),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && emailNotFound == true
                    ? 'Email not Found'
                    : null,
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ElevatedButton(
                  child: const Text('Send Email',
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                    )
                  ),
                  onPressed: () {
                    resetPassword(emailController).then((value) {
                      emailNotFound = value;
                    });
                    formKey.currentState?.validate();

                    if (!emailNotFound) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogInScreen()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: Constants.buttonElevation,
                      primary: buttonColor,
                  ),
                )
            ),
          ],
        )
    );
  }
}