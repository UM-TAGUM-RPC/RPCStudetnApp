import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rpcstudentapp/Constants/Routes.dart';
import 'package:rpcstudentapp/Widgets/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Constants/Constants.dart';

final logincontroller = ChangeNotifierProvider<LoginPod>((ref) {
  return LoginPod();
});

class LoginPod extends ChangeNotifier {
  final supabase = Supabase.instance.client;
  bool isfalse = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  login({context}) async {
    isfalse = true;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  CircularProgressIndicator(
                    color: CtrlColors.red,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Login in...'),
                ],
              ),
            ),
          );
        });
    try {
      final loginresponse = await supabase.auth
          .signInWithPassword(email: email.text, password: password.text)
          .whenComplete(() {
        if (!isfalse) return;
        Navigator.pop(context);
      });
      if (loginresponse.user!.id != "") {
        prefs.setString("supabase_id", loginresponse.user!.id);
        GoRouter.of(context).goNamed(StringRoutes.homepage);
      }
    } on AuthException {
      DialogPop.dialogup(
          context: context,
          buttontext: "Close",
          message: "Login Failed Please Check Credentials",
          onpress: () {
            GoRouter.of(context).pop();
          });
    }
  }
}
