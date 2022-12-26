import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class singUp extends StatelessWidget {
  const singUp({super.key});

  @override
  Widget build(BuildContext context) {
    return singUpBody();
  }
}

class singUpBody extends StatefulWidget {
  const singUpBody({super.key});

  @override
  State<singUpBody> createState() => _singUpBodyState();
}

class _singUpBodyState extends State<singUpBody> {
  late TextEditingController inputsignUpUserId;
  late TextEditingController inputsignUpUserPw;
  late TextEditingController inputsignUpUserEmail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputsignUpUserId = TextEditingController();
    inputsignUpUserPw = TextEditingController();
    inputsignUpUserEmail = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              'Sing Up',
            ),
            TextField(
              controller: inputsignUpUserId,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Plz Input your ID',
              ),
            ),
            TextField(
              controller: inputsignUpUserId,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Plz Input your ID',
              ),
            ),
            TextField(
              controller: inputsignUpUserEmail,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Plz Input your E-mail',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //-- sing up button
              },
              child: const Text(
                'Sing Up!',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
