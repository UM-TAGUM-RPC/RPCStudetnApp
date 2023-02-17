import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final profilecontroller = ChangeNotifierProvider<ProfilePod>((ref) {
  return ProfilePod();
});


class ProfilePod extends ChangeNotifier{
  
   String? userID;
  final supabase = Supabase.instance.client;

  getID() async {
    final prefs = await SharedPreferences.getInstance();
    userID = prefs.getString("supabase_id");
    notifyListeners();
  }


}