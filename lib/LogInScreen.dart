import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/dbOperations.dart';
import 'Constants.dart';
import 'CreateAccount.dart';
import 'ResetPassword.dart';

// TODO: keyboard is bright red, we want it to be teal as well

//class for the log in screen
class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  static const backgroundColor = Constants.cyan2;//Constants.teal; //Constants.tealAccent;
  static const buttonColor = Constants.white;// Constants.cyan; // Constants.cyan;
  static const textColor = Colors.black;
  static const clickableColor = Color(0xff1664bd); //Color(0xff1664bd)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text('Skin Safety Scanner',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: textColor,
              )
          ),
          iconTheme: const IconThemeData(
            color: textColor,
          ),
          centerTitle: true,
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: const Text(
                  'Skin Safety Scanner\n',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                    color: textColor,
                      fontSize: 34
                  ),
                )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                style: const TextStyle(
                  color: textColor,
                ),
                controller: emailController,
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email'
                    : null,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                style: const TextStyle(
                  color: textColor,
                ),
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  fillColor: Constants.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: textColor
                      )
                  ),
                  labelText: 'Password',
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < 6
                    ? 'Enter min. 6 characters'
                    : null,
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const ResetPassword()), // go to reset password
                );
              },
              child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                    color: clickableColor,
                    fontSize: 16
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Container(
                width: 120,
                height: 50,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ElevatedButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        // fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: () {
                   // if (formKey.currentState!.validate()) {
                      signInUser(emailController, passwordController, context);
                   // }
                  },
                    style: ElevatedButton.styleFrom(
                      elevation: Constants.buttonElevation,
                      primary: buttonColor
                    )
                )
            ),
            ),

            Row(
              children: <Widget>[
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(fontSize: 16, color: textColor),
                ),
                TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: clickableColor),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CreateAccount()), // go to homepage
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        )
    );
  }
}