import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';

class ButtonRounded extends StatelessWidget {
  final void Function()? onPressed;
  final String? label;
  final double? fontSize, round, width, heigth;
  final Color? fontColor, backColor;

  const ButtonRounded(
      {super.key,
      this.onPressed,
      this.label,
      this.fontSize,
      this.round,
      this.width,
      this.heigth,
      this.fontColor,
      this.backColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heigth ?? 55.h,
      width: width ?? 200.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: backColor ?? CtrlColors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(round ?? 0.0),
            )),
        child: Center(
            child: Text(
          label!,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'GeneralSans',
          ),
        ),
        ),
      ),
    );
  }
}
