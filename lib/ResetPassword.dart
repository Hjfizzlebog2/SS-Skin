import 'package:flutter/material.dart';
import 'package:ss_skin_project/RegisteredHomePage.dart';

// class for the reset password screen
class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  ResetPasswordState createState() => ResetPasswordState();
}

class ResetPasswordState extends State<ResetPassword> {
  // TODO: Figure out how to emulate this page
  // TODO: Figure out how to make a proper back button
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skin Safety Scanner'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(15),
              width: 270,
              height: 90,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisteredHomePage()),
                  );
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueGrey)),
                label: const Text(
                    'Back',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Reset\nPassword',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34
                ),
              ),
            ),
            ListView(padding: const EdgeInsets.all(32), children: [
              buildEmail(),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text(
                    'Reset Password',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )
                ),
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blueGrey)),
              ),
            ]),
          ],
        ));
  }

  Widget buildEmail() => TextField(
    controller: emailController,
    decoration: InputDecoration(
      hintText: 'name@example.com',
      labelText: 'Email',
      prefixIcon: const Icon(Icons.mail),
      suffixIcon: emailController.text.isEmpty
          ? Container(width: 0)
          : IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => emailController.clear(),
      ),
      border: const OutlineInputBorder(),
    ),
    keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.done,
  );
}