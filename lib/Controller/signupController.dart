import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';
import 'package:rpcstudentapp/Constants/Routes.dart';
import 'package:rpcstudentapp/Model/Courses.dart';
import 'package:rpcstudentapp/Widgets/dialog.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final P = ChangeNotifierProvider<SignUpPod>((ref) {
  return SignUpPod();
});

class SignUpPod extends ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController middlename = TextEditingController();
  final TextEditingController mobilenumber = TextEditingController();
  final TextEditingController idnumber = TextEditingController();
  final TextEditingController birthdate = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

  final supabase = Supabase.instance.client;
  DateTime birthSelected = DateTime.now();
  final formatDate = DateFormat("dd-MM-yyyy");
  bool isloading = false;
  List<Course> listcourse = <Course>[];
  Course course = Course();

  selectDate(context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: birthSelected,
      firstDate: DateTime(1970),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      birthdate.text = formatDate.format(date);
      notifyListeners();
    }
  }

  selectedItem(Course? c) {
    course = c!;
    notifyListeners();
  }

  clear() {
    email.clear();
    firstname.clear();
    lastname.clear();
    middlename.clear();
    mobilenumber.clear();
    idnumber.clear();
    birthdate.clear();
    password.clear();
    confirmpassword.clear();
    isloading = false;
    notifyListeners();
  }

  showCourse() async {
    final List<dynamic> course = await supabase.from("courses").select();
    listcourse = course.map((e) => Course.fromJson(e)).toList();
    notifyListeners();
  }

  signup({context}) async {
    isloading = true;
    notifyListeners();
    try {
      final checkduplicate = await supabase
          .from("users")
          .select()
          .eq("idNumber", idnumber.text)
          .single();
      if (checkduplicate != {}) {
        DialogPop.dialogup(
            context: context,
            message: "ID Number already Exist",
            onpress: () {
              GoRouter.of(context).pop();
            });
        return;
      }
    } on PostgrestException catch (e) {
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
                    Text('inserting data...'),
                  ],
                ),
              ),
            );
          });
      final save = await supabase.auth
          .signUp(email: email.text, password: password.text);
      if (save.user!.id != "") {
        try {
          await supabase.from("users").insert({
            "idNumber": idnumber.text,
            "email": email.text,
            "confirmationCode": "NONE",
            "firstName": firstname.text,
            "lastName": lastname.text,
            "middleName": middlename.text,
            "mobileNumber": mobilenumber.text,
            "birth": birthdate.text,
            "passwordCopy": password.text,
            "role": "Student",
            "supabase_id": save.user!.id,
            "active": false,
          }).then((value) async {
            await supabase.from("user_department").insert({
              "id_number": idnumber.text,
              "supabase_id": save.user!.id,
              "course_id": course.id
            });
          }).whenComplete(() async {
            if (!isloading) return;
            Navigator.of(context).pop();
            clear();
            GoRouter.of(context).goNamed(StringRoutes.login);
          });
        } on PostgrestException catch (e) {
          if (!isloading) return;
          Navigator.of(context).pop();

          DialogPop.dialogup(
              context: context,
              buttontext: "Close",
              message: e.message,
              onpress: () {
                GoRouter.of(context).pop();
              });
        }
      }
      return;
    } on AuthException catch (e) {
      if (!isloading) return;
      Navigator.of(context).pop();
    }
  }
}
