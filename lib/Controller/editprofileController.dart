import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';
import 'package:rpcstudentapp/Widgets/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  getID() async {
    final prefs = await SharedPreferences.getInstance();
    userID = prefs.getString("supabase_id");
    notifyListeners();
  }

  edit({context,
      firstName,
      middleName,
      lastName,
      birthDate,
      mobileNumber,
      passwordCopy}) async {
    isloading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();

    try {
      await supabase
          .from('users')
          .update({
            "firstName": firstname.text == "" ? firstName : firstname.text,
            "middleName": middlename.text == "" ? middleName : middlename.text,
            "lastName": lastname.text == "" ? lastName : lastname.text,
            "mobileNumber":
                mobilenumber.text == "" ? mobileNumber : mobilenumber.text,
            "birth": birthdate.text == "" ? birthDate : birthdate.text,
            "passwordCopy": password.text == "" ? passwordCopy : password.text,
          })
          .eq("supabase_id", prefs.getString("supabase_id"))
          .then((value) {
            if (!isloading) {
              return;
            }
          })
          .whenComplete(() {
            if (!isloading) {
              return;
            }
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
