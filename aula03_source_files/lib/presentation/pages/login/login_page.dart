import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _emailNode = FocusNode();
  final FocusNode _senhaNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mobx App"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              focusNode: _emailNode,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) =>
                  FocusScope.of(context).requestFocus(_senhaNode),
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  hintText: "Informe o email"),
            ),
            TextField(
              focusNode: _senhaNode,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.security,
                  ),
                  hintText: "Informe a senha"),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: ElevatedButton(
                child: Text("Acessar"),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
