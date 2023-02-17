import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rpcstudentapp/Constants/Routes.dart';
import 'package:rpcstudentapp/Widgets/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final homepagecontroller = ChangeNotifierProvider<HomePagePod>((ref) {
  return HomePagePod();
});

class HomePagePod extends ChangeNotifier {
  String? userID;
  final supabase = Supabase.instance.client;

  getUser() async {
    final prefs = await SharedPreferences.getInstance();
    userID = prefs.getString("supabase_id");
    notifyListeners();
  }

  removeuser({context}) async {
    final prefs = await SharedPreferences.getInstance();
    DialogPop.dialogup(
        context: context,
        buttontext: "Yes",
        message: "Are you sure?",
        onpress: () {
          prefs.remove("supabase_id");
          GoRouter.of(context).pop();
          GoRouter.of(context).goNamed(StringRoutes.login);
        });
    notifyListeners();
  }
  
}
