import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:ss_skin_project/dbOperations.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Skin Safety Scanner"),
          centerTitle: true,
          backgroundColor: Colors.cyan[600],
          automaticallyImplyLeading: false
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: const Text(
                  'Skin Safety Scanner\n',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34
                  ),
                )
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
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
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
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
              ),
            ),
            Container(
                width: 120,
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text(
                      'Login',
                    style: TextStyle(fontSize: 20,),
                  ),
                  onPressed: () {
                   // if (formKey.currentState!.validate()) {
                      signInUser(emailController, passwordController, context);
                   // }
                  },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan[600]
                    )
                )
            ),
            Row(
              children: <Widget>[
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18),
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