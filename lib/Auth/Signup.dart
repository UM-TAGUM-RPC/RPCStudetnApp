import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rpcstudentapp/Constants/Validator.dart';
import 'package:rpcstudentapp/Controller/signupController.dart';
import 'package:rpcstudentapp/Model/Courses.dart';

import '../Constants/Constants.dart';

final password = AutoDisposeStateProvider((ref) => true);
final confirmpassword = AutoDisposeStateProvider((ref) => false);

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  final GlobalKey<FormState> signupKey = GlobalKey<FormState>();
  @override
  void initState() {
    ref.read(P.notifier).showCourse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final obs1 = ref.watch(password);
    final obs = ref.watch(confirmpassword);
    final controller = ref.watch(P);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          toolbarHeight: 30,
          elevation: 0.0,
        ),
        body: WillPopScope(
          onWillPop: () async => false,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Form(
                key: signupKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              GoRouter.of(context).pop();
                            },
                            child: SvgPicture.asset(CtrlSvg.back)),
                        10.horizontalSpace,
                        Text(
                          "Back",
                          style: TextStyle(
                            color: CtrlColors.black,
                            fontFamily: "GeneralSans",
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "S",
                          style: TextStyle(
                            color: CtrlColors.red,
                            fontFamily: "GeneralSans",
                            fontSize: 36.sp,
                          ),
                        ),
                        Text(
                          "ign",
                          style: TextStyle(
                            color: CtrlColors.black,
                            fontFamily: "GeneralSans",
                            fontSize: 36.sp,
                          ),
                        ),
                        10.verticalSpace,
                        Text(
                          "up",
                          style: TextStyle(
                            color: CtrlColors.black,
                            fontFamily: "GeneralSans",
                            fontSize: 36.sp,
                          ),
                        ),
                        10.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: SvgPicture.asset(
                            CtrlSvg.signupperson,
                            height: 30.h,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: 245.h,
                        child: const Divider(
                          thickness: 1.0,
                          color: CtrlColors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, top: 30),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xFFF7F7F7),
                            ),
                            child: TextFormField(
                              controller: controller.email,
                              validator: (value) => Validator.emptyField(value),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                floatingLabelStyle:
                                    const TextStyle(color: CtrlColors.red),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    fontFamily: "GeneralSansRegular",
                                    fontSize: 12.sp,
                                    color: const Color(0xFF404042)),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: SvgPicture.asset(
                                    CtrlSvg.email,
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
                          25.verticalSpace,
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xFFF7F7F7),
                            ),
                            child: TextFormField(
                              controller: controller.firstname,
                              validator: (val) => Validator.emptyField(val),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  floatingLabelStyle:
                                      const TextStyle(color: CtrlColors.red),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  labelText: "First Name",
                                  labelStyle: TextStyle(
                                      fontFamily: "GeneralSansRegular",
                                      fontSize: 12.sp,
                                      color: const Color(0xFF404042)),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: SvgPicture.asset(
                                      CtrlSvg.idbadge,
                                      height: 18.h,
                                      width: 18.w,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none),
                            ),
                          ),
                          25.verticalSpace,
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xFFF7F7F7),
                            ),
                            child: TextFormField(
                              controller: controller.lastname,
                              validator: (val) => Validator.emptyField(val),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  floatingLabelStyle:
                                      const TextStyle(color: CtrlColors.red),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(
                                      fontFamily: "GeneralSansRegular",
                                      fontSize: 12.sp,
                                      color: const Color(0xFF404042)),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: SvgPicture.asset(
                                      CtrlSvg.idbadge,
                                      height: 18.h,
                                      width: 18.w,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                constraints: BoxConstraints.tightFor(
                                  width: 150.w,
                                ),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xFFF7F7F7),
                                ),
                                child: TextFormField(
                                  controller: controller.middlename,
                                  validator: (val) => Validator.emptyField(val),
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                      floatingLabelStyle: const TextStyle(
                                          color: CtrlColors.red),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                      labelText: "Middle Name",
                                      labelStyle: TextStyle(
                                          fontFamily: "GeneralSansRegular",
                                          fontSize: 12.sp,
                                          color: const Color(0xFF404042)),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: SvgPicture.asset(
                                          CtrlSvg.idbadge,
                                          height: 18.h,
                                          width: 18.w,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints.tightFor(
                                  width: 150.w,
                                ),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xFFF7F7F7),
                                ),
                                child: TextFormField(
                                  controller: controller.mobilenumber,
                                  validator: (value) =>
                                      Validator.validatenumber(value),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                      floatingLabelStyle: const TextStyle(
                                          color: CtrlColors.red),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                      labelText: "Mobile Number",
                                      labelStyle: TextStyle(
                                          fontFamily: "GeneralSansRegular",
                                          fontSize: 12.sp,
                                          color: const Color(0xFF404042)),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: SvgPicture.asset(
                                          CtrlSvg.mobile,
                                          height: 18.h,
                                          width: 18.w,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                          25.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                constraints: BoxConstraints.tightFor(
                                  width: 150.w,
                                ),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xFFF7F7F7),
                                ),
                                child: TextFormField(
                                  controller: controller.idnumber,
                                  validator: (val) => Validator.emptyField(val),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.auto,
                                      floatingLabelStyle: const TextStyle(
                                          color: CtrlColors.red),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                      labelText: "ID Number",
                                      labelStyle: TextStyle(
                                          fontFamily: "GeneralSansRegular",
                                          fontSize: 12.sp,
                                          color: const Color(0xFF404042)),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: SvgPicture.asset(
                                          CtrlSvg.idbadge,
                                          height: 18.h,
                                          width: 18.w,
                                        ),
                                      ),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  controller.selectDate(context);
                                },
                                child: Container(
                                  constraints: BoxConstraints.tightFor(
                                    width: 150.w,
                                  ),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color(0xFFF7F7F7),
                                  ),
                                  child: AbsorbPointer(
                                    absorbing: true,
                                    child: TextFormField(
                                      controller: controller.birthdate,
                                      validator: (value) =>
                                          Validator.emptyField(value),
                                      keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.auto,
                                          floatingLabelStyle: const TextStyle(
                                              color: CtrlColors.red),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                          labelText: "Birthdate",
                                          labelStyle: TextStyle(
                                              fontFamily: "GeneralSansRegular",
                                              fontSize: 12.sp,
                                              color: const Color(0xFF404042)),
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: SvgPicture.asset(
                                              CtrlSvg.idbadge,
                                              height: 18.h,
                                              width: 18.w,
                                            ),
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          25.verticalSpace,
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xFFF7F7F7),
                            ),
                            child: DropdownSearch<Course>(
                              dropdownBuilder: (context, selectedItem) {
                                return Text(
                                  selectedItem!.courseDepartment ??
                                      "Search Course Department",
                                  style: TextStyle(
                                      fontFamily: 'GeneralSansRegular',
                                      fontSize: 15.sp,
                                      color: CtrlColors.black),
                                );
                              },
                              decoratorProps: DropDownDecoratorProps(
                                  decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 14,
                                ),
                                hintText: "Search Course Department",
                                hintStyle: TextStyle(
                                  color: CtrlColors.black,
                                  fontSize: 15.sp,
                                  fontFamily: "GeneralSansRegular",
                                ),
                                fillColor: const Color(0xFFF7F7F7),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SvgPicture.asset(
                                    CtrlSvg.search,
                                    width: 12.w,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                              selectedItem: controller.course,
                              items: (filter, loadProps) =>
                                  controller.listcourse,
                              itemAsString: (item) => item.courseDepartment!,
                              popupProps: PopupProps.dialog(
                                showSearchBox: true,
                                searchFieldProps: TextFieldProps(
                                  style: TextStyle(
                                    color: CtrlColors.black,
                                    fontSize: 12.sp,
                                    fontFamily: "GeneralSans",
                                    fontWeight: FontWeight.w700,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 12,
                                      horizontal: 14,
                                    ),
                                    hintText: "Search Department",
                                    hintStyle: TextStyle(
                                      color: CtrlColors.black,
                                      fontSize: 15.sp,
                                      fontFamily: "GeneralSansRegular",
                                      fontWeight: FontWeight.w500,
                                    ),
                                    filled: true,
                                    fillColor: const Color(0xFFF7F7F7),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: SvgPicture.asset(
                                        CtrlSvg.search,
                                        width: 12.w,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                itemBuilder: (context, item, c, isSelected) =>
                                    Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    item.courseDepartment!,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      color: CtrlColors.black,
                                    ),
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                controller.selectedItem(value);
                              },
                              validator: (value) {
                                if (controller.course == Course()) {
                                  return "Empty Course";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          25.verticalSpace,
                          Container(
                            // constraints: const BoxConstraints.tightFor(
                            //   width: 160,
                            // ),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xFFF7F7F7),
                            ),
                            child: TextFormField(
                              controller: controller.password,
                              validator: (value) => Validator.emptyField(value),
                              obscureText: obs1,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  floatingLabelStyle:
                                      const TextStyle(color: CtrlColors.red),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      fontFamily: "GeneralSansRegular",
                                      fontSize: 12.sp,
                                      color: const Color(0xFF404042)),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: SvgPicture.asset(
                                      CtrlSvg.lock,
                                      height: 18.h,
                                      width: 18.w,
                                    ),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      ref.read(password.notifier).state = !obs1;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: SvgPicture.asset(
                                        CtrlSvg.obscure1,
                                        height: 15.h,
                                        width: 15.w,
                                      ),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none),
                            ),
                          ),
                          25.verticalSpace,
                          Container(
                            // constraints: const BoxConstraints.tightFor(
                            //   width: 160,
                            // ),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Color(0xFFF7F7F7),
                            ),
                            child: TextFormField(
                              obscureText: obs,
                              controller: controller.confirmpassword,
                              validator: (val) => Validator.confirmPass(
                                pass1: controller.password.text,
                                pass: val,
                              ),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                  floatingLabelStyle:
                                      const TextStyle(color: CtrlColors.red),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  labelText: "Confirm Password",
                                  labelStyle: TextStyle(
                                      fontFamily: "GeneralSansRegular",
                                      fontSize: 12.sp,
                                      color: const Color(0xFF404042)),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: SvgPicture.asset(
                                      CtrlSvg.lock,
                                      height: 18.h,
                                      width: 18.w,
                                    ),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      ref.read(confirmpassword.notifier).state =
                                          !obs;
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: SvgPicture.asset(
                                        CtrlSvg.notobscure,
                                        height: 18.h,
                                        width: 18.w,
                                      ),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none),
                            ),
                          ),
                          25.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(),
                              SizedBox(
                                height: 50.h,
                                width: 135.w,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      backgroundColor: const Color(0xFFEC4969),
                                    ),
                                    onPressed: () {
                                      if (signupKey.currentState!.validate() ==
                                          true) {
                                        controller.signup(context: context);
                                      } else {
                                        return;
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            fontFamily: 'GeneralSans',
                                            color: Colors.white,
                                            fontSize: 18.sp),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          25.verticalSpace,
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
