import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../res/image_assets.dart';


class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  // late final AuthenticationService _authenticationService =
  // AuthenticationService(context);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Row(
          children: [
            Image.asset(ImageAssets.plannerLogo, width: 70, height: 70,),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  void _openConnectionCodePage() {
  //  Navigator.of(context).pushNamed(routeConnectionCodeLogin);
  }

  void _openScanPage() {
  //  Navigator.of(context).pushNamed(routeScanner, arguments: 'LOGIN');
  }

  void _openSignUpPage() {
  //  Navigator.of(context).pushNamed(routeSignUp);
  }
}
