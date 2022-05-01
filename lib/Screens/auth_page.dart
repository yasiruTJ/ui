import 'package:flutter/cupertino.dart';
import 'package:sdgp_ui/SignUp/choosegender.dart';
import 'login.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? Login(onClickedSignUp: toggle)
      : ChooseGender(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
