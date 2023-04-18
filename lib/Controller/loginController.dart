import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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

  getuser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString("supabase_id");
  }

  login({context}) async {
    final prefs = await SharedPreferences.getInstance();
    final res = await FirebaseMessaging.instance.getToken();
    isfalse = true;
    notifyListeners();
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
          .whenComplete(() {});
      prefs.setString("supabase_id", loginresponse.user!.id);

      if (loginresponse.user!.id != "") {
        final Map<String, dynamic> userID = await supabase
            .from("users")
            .select()
            .eq("supabase_id", loginresponse.user!.id)
            .single();

        if (userID != "") {
          if (userID["role"] == "Student") {
            prefs.setInt("id", userID['id']);
            print(userID['role']);
            GoRouter.of(context).pop();
            GoRouter.of(context).go("/homepage");

            // final Map<String, dynamic> getToken = await supabase
            //     .from("users")
            //     .select()
            //     .eq("supabase_id", loginresponse.user!.id)
            //     .single();

            //     if (getToken["token_device"] == res) {
            //     await supabase
            //         .from("notification_token_device")
            //         .update({
            //           "token_device": res,
            //         })
            //         .eq("supabase_id", userID['supabase_id'])
            //         .whenComplete(() {
            //           GoRouter.of(context).push("/homepage");
            //           onSuccess!();
            //         });
            //   }
          } else {
            GoRouter.of(context).pop();
            DialogPop.dialogup(
                context: context,
                buttontext: "Close",
                message: "User Account is not a Student",
                onpress: () {
                  GoRouter.of(context).pop();
                });
          }
        }
      }
    } on AuthException {
      GoRouter.of(context).pop();
      DialogPop.dialogup(
          context: context,
          buttontext: "Close",
          message: "Login Failed Please Check Credentials",
          onpress: () {
            GoRouter.of(context).pop();
          });
    } on PostgrestException {
      await supabase.from("notification_token_device").insert({
        "supabase_id": prefs.getString("supabase_id"),
        "user_id": prefs.getInt("id"),
        "token_device": res,
      });
    }
  }
}
