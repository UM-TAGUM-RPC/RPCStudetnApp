import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';
import 'package:rpcstudentapp/Widgets/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Model/Courses.dart';

final editprofilecontroller = ChangeNotifierProvider<EditProfilePod>((ref) {
  return EditProfilePod();
});

class EditProfilePod extends ChangeNotifier {
  final TextEditingController email = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController middlename = TextEditingController();
  final TextEditingController mobilenumber = TextEditingController();
  final TextEditingController idnumber = TextEditingController();
  final TextEditingController birthdate = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();

  String? userID;
  final supabase = Supabase.instance.client;
  bool isloading = false;
  DateTime birthSelected = DateTime.now();
  final formatDate = DateFormat("dd-MM-yyyy");

  Map<String, dynamic> userDepartment = Map<String, dynamic>();
  String? course_department;
  List<Course> listcourse = <Course>[];
  Course course = Course();

  // selectDate(context) async {
  //   final date = await showDatePicker(
  //     context: context,
  //     initialDate: birthSelected,
  //     firstDate: DateTime(1970),
  //     lastDate: DateTime(2050),
  //   );
  //   if (date != null) {
  //     birthdate.text = formatDate.format(date);
  //     notifyListeners();
  //   }
  // }

  selectedItem(Course? c) {
    course = c!;
    notifyListeners();
  }

  showCourse() async {
    final List<dynamic> course = await supabase.from("courses").select();
    listcourse = course.map((e) => Course.fromJson(e)).toList();
    notifyListeners();
  }

  getID() async {
    final prefs = await SharedPreferences.getInstance();
    userID = prefs.getString("supabase_id");
    notifyListeners();
  }

  displayCourse() async {
    final depart = await supabase
        .from("user_department")
        .select()
        .eq("supabase_id", userID ?? "")
        .single();
    if (depart != null) {
      userDepartment.addAll(depart);
      notifyListeners();
      final courseName = await supabase
          .from("courses")
          .select()
          .eq("id", userDepartment['course_id'])
          .single();
      if (courseName != null) {
        course_department = "${courseName['courseDepartment']}";
        notifyListeners();
      }
    }
  }

  update() async {
    final department = await supabase
        .from("user_department")
        .select()
        .eq("supabase_id", userID ?? "")
        .single();
    if (course.id != null) {
      await supabase
          .from("user_department")
          .update({"course_id": course.id}).eq("supabase_id", userID??"");
    } else {
      userDepartment.addAll(department);
      await supabase.from("user_department").update(
          {"course_id": userDepartment['course_id']}).eq("supabase_id", userID??"");
    }
  }

  edit({
    context,
    firstName,
    middleName,
    lastName,
    birthDate,
    mobileNumber,
  }) async {
    isloading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();

    try {
      update();
      await supabase
          .from('users')
          .update({
            "firstName": firstname.text == "" ? firstName : firstname.text,
            "middleName": middlename.text == "" ? middleName : middlename.text,
            "lastName": lastname.text == "" ? lastName : lastname.text,
            "mobileNumber": mobilenumber.text == "" ? mobileNumber : mobilenumber.text,
            "birth": birthdate.text == "" ? birthDate : birthdate.text,
          })
          .eq("supabase_id", prefs.getString("supabase_id") ??"")
          .then((value) {})
          .whenComplete(() {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                behavior: SnackBarBehavior.floating,
                dismissDirection: DismissDirection.endToStart,
                backgroundColor: CtrlColors.red,
                content: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Edit Succesfully",
                    style: TextStyle(color: Colors.white),
                  ),
                )));
          });
    } on PostgrestException catch (e) {
      DialogPop.dialogup(
          buttontext: "Close",
          context: context,
          message: e.message,
          onpress: () {
            GoRouter.of(context).pop();
          });
    }
  }
}
