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

  static const screenColor = Colors.white;
  static const buttonColor = Constants.teal;
  static const textColor = Colors.white;
  static const titleColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.cyan[600],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                child: const Text(
                  'Reset Password',
                  style: TextStyle(
                    color: titleColor,
                      //fontWeight: FontWeight.bold,
                      fontSize: 34),
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && emailNotFound == true
                    ? 'Email not Found'
                    : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
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
                      primary: Colors.cyan[600]
                  ),
                )
            ),
          ],
        )
    );
  }
}