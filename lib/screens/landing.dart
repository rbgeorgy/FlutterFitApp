import 'package:fitness_app/screens/auth.dart';
import 'package:fitness_app/screens/home.dart';
import 'package:fitness_app/domain/user.dart' as uuser;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uuser.User user = Provider.of<uuser.User>(context);

    final bool isLoggedIn = user != null;

    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
