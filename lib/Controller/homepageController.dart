// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rpcstudentapp/Constants/Routes.dart';
import 'package:rpcstudentapp/Widgets/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:dio/dio.dart' as d;

import '../Constants/Constants.dart';

final homepagecontroller = ChangeNotifierProvider<HomePagePod>((ref) {
  return HomePagePod();
});

class HomePagePod extends ChangeNotifier {
  final TextEditingController zcode = TextEditingController();
  static final dio = d.Dio();
  String? userID;
  int? id;
  String? code;
  final supabase = Supabase.instance.client;

  getUser() async {
    final prefs = await SharedPreferences.getInstance();
    userID = prefs.getString("supabase_id");
    id = prefs.getInt("id");
    notifyListeners();
  }

  getCode() async {
    final prefs = await SharedPreferences.getInstance();
    code = prefs.getString("code");
    notifyListeners();
  }

  // ignore: body_might_complete_normally_nullable
  String? statuses(
      {approve_title,
      outline_proposal,
      outline_defense,
      data_gather,
      manuscript,
      final_oral_prep,
      routing,
      plagiarism,
      approval,
      final_output,
      subject_teacher,
      research_coordinator}) {
    if (approve_title == true &&
        outline_proposal == true &&
        outline_defense == true &&
        data_gather == true &&
        manuscript == true &&
        final_oral_prep == true &&
        routing == true &&
        plagiarism == true &&
        approval == true &&
        final_output == true &&
        subject_teacher == true &&
        research_coordinator == true) {
      return "Complete";
    } else if (approve_title == true &&
        outline_proposal == true &&
        outline_defense == true &&
        data_gather == true &&
        manuscript == true &&
        final_oral_prep == true &&
        routing == true &&
        plagiarism == true &&
        approval == true) {
      return "Submission of Approved Final Output(Book Form)";
    } else if (approve_title == true &&
        outline_proposal == true &&
        outline_defense == true &&
        data_gather == true &&
        manuscript == true &&
        final_oral_prep == true &&
        routing == true &&
        plagiarism == true) {
      return "Approval";
    } else if (approve_title == true &&
        outline_proposal == true &&
        outline_defense == true &&
        data_gather == true &&
        manuscript == true &&
        final_oral_prep == true &&
        routing == true) {
      return "Plagiarism Check";
    } else if (approve_title == true &&
        outline_proposal == true &&
        outline_defense == true &&
        data_gather == true &&
        manuscript == true &&
        final_oral_prep == true) {
      return "Routing";
    } else if (approve_title == true &&
        outline_proposal == true &&
        outline_defense == true &&
        data_gather == true &&
        manuscript == true) {
      return "Final Oral Presentation";
    } else if (approve_title == true &&
        outline_proposal == true &&
        outline_defense == true &&
        data_gather == true) {
      return "Manuscript for Oral Presentation";
    } else if (approve_title == true &&
        outline_proposal == true &&
        outline_defense == true) {
      return "Data Gathering";
    } else if (approve_title == true && outline_proposal == true) {
      return "Outline Defense";
    } else if (approve_title == true) {
      return "Outline Proposal";
    } else {
      return "Approval of Title";
    }
  }

  popUp({context, ref}) {
    return showGeneralDialog(
        barrierLabel: '',
        barrierDismissible: true,
        context: context,
        transitionDuration: const Duration(milliseconds: 200),
        transitionBuilder: (a, b, c, d) {
          return Transform.scale(
            scale: b.value,
            child: Opacity(
              opacity: b.value,
              child: Dialog(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    12.verticalSpace,
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      height: 200.h,
                      width: 230.w,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 50),
                              child: Text(
                                'Enter Code: ',
                                style: TextStyle(
                                    fontFamily: 'GeneralSans',
                                    fontSize: 15.sp,
                                    color: CtrlColors.black),
                              ),
                            ),
                            10.verticalSpace,
                            Container(
                              width: 210.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextFormField(
                                controller: zcode,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  filled: true,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  floatingLabelStyle:
                                      const TextStyle(color: CtrlColors.red),
                                  labelText: "Code",
                                  labelStyle: TextStyle(
                                      fontFamily: "GeneralSans",
                                      fontSize: 12.sp,
                                      color: Color(0xFF404042)),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: SvgPicture.asset(
                                      CtrlSvg.giftCode,
                                      height: 18.h,
                                      width: 18.w,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                            15.verticalSpace,
                            SizedBox(
                              width: 130,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    backgroundColor: const Color(0xFFEC4969),
                                  ),
                                  onPressed: () async {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    if (zcode.text.isNotEmpty) {
                                      prefs.setString("code", zcode.text);
                                      // ignore: use_build_context_synchronously
                                      Navigator.of(context).pop();
                                      GoRouter.of(context).push("/homepage");
                                    }
                                  },
                                  child: Center(
                                    child: Text(
                                      'Submit Code',
                                      style: TextStyle(
                                          fontFamily: 'GeneralSans',
                                          color: Colors.white,
                                          fontSize: 15.sp),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const SizedBox.shrink();
        });
  }

  doneRequest({context}) {
    return showGeneralDialog(
        barrierLabel: '',
        barrierDismissible: true,
        context: context,
        transitionDuration: const Duration(milliseconds: 200),
        transitionBuilder: (a, b, c, d) {
          return Transform.scale(
            scale: b.value,
            child: Opacity(
              opacity: b.value,
              child: Dialog(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    12.verticalSpace,
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      height: 270.h,
                      width: 300.w,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              child: Image.asset(
                                CtrlSvg.request,
                                height: 100.h,
                                width: 100.w,
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              'Request Approval',
                              style: TextStyle(
                                  fontFamily: 'GeneralSans',
                                  fontSize: 15.sp,
                                  color: CtrlColors.black),
                            ),
                            10.verticalSpace,
                            Text(
                              'Already requested approval to the advisor and please check always the notification and comments given by the advisor. Good Luck......',
                              style: TextStyle(
                                  fontFamily: 'GeneralSansRegular',
                                  fontSize: 10.sp,
                                  color: CtrlColors.black),
                            ),
                            15.verticalSpace,
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      GoRouter.of(context).pop();
                                    },
                                    child: SizedBox(
                                      height: 40,
                                      width: 100,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            side: const BorderSide(
                                                color: CtrlColors.red,
                                                style: BorderStyle.solid)),
                                        child: Center(
                                          child: Text(
                                            "BACK",
                                            style: TextStyle(
                                                fontFamily: 'GeneralSans',
                                                fontSize: 10.sp,
                                                color: CtrlColors.red),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const SizedBox.shrink();
        });
  }

  static sendMessageTo({String? fcmToken, String? title, String? body}) async {
    try {
      await dio.post("https://fcm.googleapis.com/fcm/send",
          data: {
            "to": fcmToken,
            "notification": {
              "body": body ?? "",
              "title": title ?? "Notification",
            }
          },
          options: d.Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
                "key=AAAAmL5EGcU:APA91bGc1TGqnfWaqmKxqqSKMK6n_l10DhR8NYDTIQbf2WomewxehaeG1WOeS87J-yA58Rs0D0l4vv4Dk4O4LKAoEUnaLI0HWMkqaXml5IVVVner-XJT__y8Kg2pfiGs_9TelrZwGcDK",
          }));
    } on d.DioError catch (e) {
      log(e.response!.data.toString(), name: "Notification Error");
    }
  }

  dialogLoading({context}) {
    return showDialog(
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
                  Text('Requesting...'),
                ],
              ),
            ),
          );
        });
  }

  requestToApprove(
      {context,
      advisor_id,
      approve_title,
      outline_proposal,
      outline_defense,
      data_gather,
      manuscript,
      final_oral_prep,
      routing,
      plagiarism,
      approval,
      final_output,
      subject_teacher,
      research_coordinator}) {
    return showGeneralDialog(
        barrierLabel: '',
        barrierDismissible: false,
        context: context,
        transitionDuration: const Duration(milliseconds: 200),
        transitionBuilder: (a, b, c, d) {
          return Transform.scale(
            scale: b.value,
            child: Opacity(
              opacity: b.value,
              child: Dialog(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    12.verticalSpace,
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      height: 270.h,
                      width: 300.w,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left: 10),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              child: Image.asset(
                                CtrlSvg.request,
                                height: 100.h,
                                width: 100.w,
                              ),
                            ),
                            10.verticalSpace,
                            Text(
                              'Request Approval',
                              style: TextStyle(
                                  fontFamily: 'GeneralSans',
                                  fontSize: 15.sp,
                                  color: CtrlColors.black),
                            ),
                            10.verticalSpace,
                            Text(
                              'Request an approval of of the current status of the project.',
                              style: TextStyle(
                                  fontFamily: 'GeneralSansRegular',
                                  fontSize: 10.sp,
                                  color: CtrlColors.black),
                            ),
                            15.verticalSpace,
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      dialogLoading(context: context);
                                      String token = "";
                                      String current = "";
                                      final advisor_token = await supabase
                                          .from("notification_token_device")
                                          .select()
                                          .eq("supabase_id", advisor_id);
                                      if (advisor_token != null ||
                                          advisor_token != "") {
                                        token =
                                            advisor_token.first["token_device"];
                                        if (approve_title == true &&
                                            outline_proposal == true &&
                                            outline_defense == true &&
                                            data_gather == true &&
                                            manuscript == true &&
                                            final_oral_prep == true &&
                                            routing == true &&
                                            plagiarism == true &&
                                            approval == true &&
                                            final_output == true &&
                                            subject_teacher == true &&
                                            research_coordinator == true) {
                                          current = "Complete";
                                        } else if (approve_title == true &&
                                            outline_proposal == true &&
                                            outline_defense == true &&
                                            data_gather == true &&
                                            manuscript == true &&
                                            final_oral_prep == true &&
                                            routing == true &&
                                            plagiarism == true &&
                                            approval == true) {
                                          current =
                                              "Submission of Approved Final Output(Book Form)";
                                        } else if (approve_title == true &&
                                            outline_proposal == true &&
                                            outline_defense == true &&
                                            data_gather == true &&
                                            manuscript == true &&
                                            final_oral_prep == true &&
                                            routing == true &&
                                            plagiarism == true) {
                                          current = "Approval";
                                        } else if (approve_title == true &&
                                            outline_proposal == true &&
                                            outline_defense == true &&
                                            data_gather == true &&
                                            manuscript == true &&
                                            final_oral_prep == true &&
                                            routing == true) {
                                          current = "Plagiarism Check";
                                        } else if (approve_title == true &&
                                            outline_proposal == true &&
                                            outline_defense == true &&
                                            data_gather == true &&
                                            manuscript == true &&
                                            final_oral_prep == true) {
                                          current = "Routing";
                                        } else if (approve_title == true &&
                                            outline_proposal == true &&
                                            outline_defense == true &&
                                            data_gather == true &&
                                            manuscript == true) {
                                          current = "Final Oral Presentation";
                                        } else if (approve_title == true &&
                                            outline_proposal == true &&
                                            outline_defense == true &&
                                            data_gather == true) {
                                          current =
                                              "Manuscript for Oral Presentation";
                                        } else if (approve_title == true &&
                                            outline_proposal == true &&
                                            outline_defense == true) {
                                          current = "Data Gathering";
                                        } else if (approve_title == true &&
                                            outline_proposal == true) {
                                          current = "Outline Defense";
                                        } else if (approve_title == true) {
                                          current = "Outline Proposal";
                                        } else {
                                          current = "Approval of Title";
                                        }
                                        String approvalName = "";
                                        String advisorID = "";
                                        String monitorID = "";
                                        final name = await supabase
                                            .from("users")
                                            .select()
                                            .eq("supabase_id", userID);
                                        if (name != "" || name != null) {
                                          approvalName =
                                              "${name.first["firstName"]} ${name.first["lastName"]}";
                                        }
                                        final advisor_data = await supabase
                                            .from("users")
                                            .select()
                                            .eq("supabase_id", advisor_id);
                                        if (advisor_data != "" ||
                                            advisor_data != null) {
                                          advisorID = advisor_data.first['id']
                                              .toString();
                                        }
                                        final monitor_data = await supabase
                                            .from("monitoring_sheet")
                                            .select()
                                            .eq("z_code", code);
                                        if (monitor_data != "" ||
                                            monitor_data != null) {
                                          monitorID = monitor_data.first['id']
                                              .toString();
                                        }

                                        await supabase
                                            .from("monitoring_sheet")
                                            .update({
                                              "current": current,
                                            })
                                            .eq("z_code", code)
                                            .whenComplete(() async {
                                              log("update complete");
                                            });
                                        await supabase
                                            .from("notifications")
                                            .insert({
                                          "message":
                                              "$approvalName requested to approve the current status of the project, $current",
                                          "from_id": id,
                                          "to_id": advisorID,
                                          "monitor_id": monitorID
                                        }).then((value) {
                                          sendMessageTo(
                                            fcmToken: token,
                                            title: "Approval",
                                            body:
                                                "$approvalName requested to approve the current status of the project, $current",
                                          );
                                        }).whenComplete(() async {
                                          GoRouter.of(context)
                                              .push("/homepage");
                                          GoRouter.of(context).pop();
                                          GoRouter.of(context).pop();
                                          doneRequest(context: context);
                                        });
                                      }
                                    },
                                    child: SizedBox(
                                      height: 40,
                                      width: 100,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            side: const BorderSide(
                                                color: CtrlColors.red,
                                                style: BorderStyle.solid)),
                                        child: Center(
                                          child: Text(
                                            "YES",
                                            style: TextStyle(
                                                fontFamily: 'GeneralSans',
                                                fontSize: 10.sp,
                                                color: CtrlColors.red),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      GoRouter.of(context).pop();
                                    },
                                    child: SizedBox(
                                      height: 40,
                                      width: 100,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            side: const BorderSide(
                                                color: CtrlColors.red,
                                                style: BorderStyle.solid)),
                                        child: Center(
                                          child: Text(
                                            "NO",
                                            style: TextStyle(
                                                fontFamily: 'GeneralSans',
                                                fontSize: 10.sp,
                                                color: CtrlColors.red),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const SizedBox.shrink();
        });
  }

  removeuser({context}) async {
    final prefs = await SharedPreferences.getInstance();
    DialogPop.dialogup(
        context: context,
        buttontext: "Yes",
        message: "Are you sure?",
        onpress: () {
          prefs.remove("supabase_id");
          prefs.remove("code");
          GoRouter.of(context).pop();
          GoRouter.of(context).goNamed(StringRoutes.login);
        });
    notifyListeners();
  }
}
