import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';
import 'package:rpcstudentapp/Widgets/button.dart';

class DialogPop {
  static dialogup({
    BuildContext? context,
    String? message,
    String? buttontext,
    Function()? onpress,
  }) {
    showGeneralDialog(
        context: context!,
        barrierColor: const Color(0xFF1A1919).withOpacity(0.3),
        barrierDismissible: true,
        barrierLabel: '',
        transitionDuration: const Duration(milliseconds: 360),
        transitionBuilder: (c, a, s, ch) {
          return Transform.scale(
            scale: a.value,
            child: Opacity(
              opacity: a.value,
              child: Dialog(
                // elevation: 1,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        width: 299.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(46.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image.asset(
                              //   Asset.warning,
                              //   height: 74.h,
                              // ),
                              18.verticalSpace,
                              Text(
                                message!,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                              28.verticalSpace,
                              ButtonRounded(
                                label: buttontext,
                                onPressed: onpress,
                                fontColor: CtrlColors.white,
                                fontSize: 12.sp,
                                backColor: CtrlColors.red,
                                round: 90,
                                heigth: 36.h,
                                width: 161.w,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
        },
        pageBuilder: (c, r, x0) {
          return const SizedBox.shrink();
        });
  }
void fetchData(BuildContext context, [bool mounted = true]) async {
    // show the loading dialog
    

    // Your asynchronous computation here (fetching data from an API, processing files, inserting something to the database, etc)
    await Future.delayed(const Duration(seconds: 3));
    // Close the dialog programmatically
    // We use "mounted" variable to get rid of the "Do not use BuildContexts across async gaps" warning
    if (!mounted) return;
    Navigator.of(context).pop();
  }
 
}
