import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';
import 'package:rpcstudentapp/Constants/Validator.dart';
import 'package:rpcstudentapp/Controller/editprofileController.dart';
import 'package:rpcstudentapp/Widgets/dialog.dart';

final password = AutoDisposeStateProvider((ref) => true);
final confirmpassword = AutoDisposeStateProvider((ref) => false);

class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    ref.read(editprofilecontroller).getID();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final obs1 = ref.watch(password);
    final obs = ref.watch(confirmpassword);
    final controller = ref.watch(editprofilecontroller);

    return StreamBuilder<dynamic>(
        stream: controller.supabase
  .from("users")
            .stream(primaryKey: ['id']).eq("supabase_id", controller.userID),
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color(0xFFF7F7F7),
                          ),
                          child: TextFormField(
                            controller: controller.firstname,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              floatingLabelStyle:
                                  const TextStyle(color: CtrlColors.red),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              labelText:
                                  "Firstname: (${snapshot.hasData == true ? snapshot.data[0]['firstName'] : ""})",
                              labelStyle: const TextStyle(
                                  fontFamily: "GeneralSansRegular",
                                  fontSize: 12,
                                  color: Color(0xFF404042)),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: SvgPicture.asset(
                                  CtrlSvg.idbadge,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color(0xFFF7F7F7),
                          ),
                          child: TextFormField(
                            controller: controller.middlename,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              floatingLabelStyle:
                                  const TextStyle(color: CtrlColors.red),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              labelText:
                                  "Middlename: (${snapshot.hasData == true ? snapshot.data[0]['middleName'] : ""})",
                              labelStyle: const TextStyle(
                                  fontFamily: "GeneralSansRegular",
                                  fontSize: 12,
                                  color: Color(0xFF404042)),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: SvgPicture.asset(
                                  CtrlSvg.idbadge,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color(0xFFF7F7F7),
                          ),
                          child: TextFormField(
                            controller: controller.lastname,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              floatingLabelStyle:
                                  const TextStyle(color: CtrlColors.red),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              labelText:
                                  "Lastname: (${snapshot.hasData == true ? snapshot.data[0]['lastName'] : ""})",
                              labelStyle: const TextStyle(
                                  fontFamily: "GeneralSansRegular",
                                  fontSize: 12,
                                  color: Color(0xFF404042)),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: SvgPicture.asset(
                                  CtrlSvg.idbadge,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color(0xFFF7F7F7),
                          ),
                          child: TextFormField(
                            controller: controller.mobilenumber,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              floatingLabelStyle:
                                  const TextStyle(color: CtrlColors.red),
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              labelText:
                                  "Mobile Number: (${snapshot.hasData == true ? snapshot.data[0]['mobileNumber'] : ""})",
                              labelStyle: const TextStyle(
                                  fontFamily: "GeneralSansRegular",
                                  fontSize: 12,
                                  color: Color(0xFF404042)),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: SvgPicture.asset(
                                  CtrlSvg.mobile,
                                  height: 18,
                                  width: 18,
                                ),
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            // controller.selectDate(context);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color(0xFFF7F7F7),
                            ),
                            child: TextFormField(
                              controller: controller.birthdate,
                              keyboardType: TextInputType.datetime,
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                floatingLabelStyle:
                                    const TextStyle(color: CtrlColors.red),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                labelText:
                                    "Birthdate: (${snapshot.hasData == true ? snapshot.data[0]['birth'] : ""})",
                                labelStyle: const TextStyle(
                                    fontFamily: "GeneralSansRegular",
                                    fontSize: 12,
                                    color: Color(0xFF404042)),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: SvgPicture.asset(
                                    CtrlSvg.idbadge,
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          // constraints: const BoxConstraints.tightFor(
                          //   width: 160,
                          // ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFFF7F7F7),
                          ),
                          child: TextFormField(
                            controller: controller.password,
                            obscureText: obs1,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                floatingLabelBehavior: FloatingLabelBehavior.auto,
                                floatingLabelStyle:
                                    const TextStyle(color: CtrlColors.red),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                labelText:
                                    "Password: (${snapshot.hasData == true ? snapshot.data[0]['passwordCopy'] : ""})",
                                labelStyle: const TextStyle(
                                    fontFamily: "GeneralSansRegular",
                                    fontSize: 12,
                                    color: Color(0xFF404042)),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: SvgPicture.asset(
                                    CtrlSvg.lock,
                                    height: 18,
                                    width: 18,
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
                                      height: 15,
                                      width: 15,
                                    ),
                                  ),
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          // constraints: const BoxConstraints.tightFor(
                          //   width: 160,
                          // ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color(0xFFF7F7F7),
                          ),
                          child: TextFormField(
                            controller: controller.confirmpassword,
                            obscureText: obs,
                            // validator: Validator.confirmPass(
                            //   pass1: controller.password.text,
                            //   pass: controller.confirmpassword.text
                            // ),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                floatingLabelStyle:
                                    const TextStyle(color: CtrlColors.red),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                labelText: "Confirm Password",
                                labelStyle: const TextStyle(
                                    fontFamily: "GeneralSansRegular",
                                    fontSize: 12,
                                    color: Color(0xFF404042)),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: SvgPicture.asset(
                                    CtrlSvg.lock,
                                    height: 18,
                                    width: 18,
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
                                      height: 18,
                                      width: 18,
                                    ),
                                  ),
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            SizedBox(
                              height: 50,
                              width: 135,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    backgroundColor: const Color(0xFFEC4969),
                                  ),
                                  onPressed: () async {
                                    if (snapshot.hasData == true) {
                                      if (controller
                                          .confirmpassword.text.isNotEmpty) {
                                        if (controller.confirmpassword.text ==
                                                controller.password.text ||
                                            controller.confirmpassword.text ==
                                                snapshot.data[0]
                                                    ['passwordCopy']) {
                                          controller.edit(
                                            context: context,
                                            firstName: snapshot.data[0]
                                                ['firstName'],
                                            middleName: snapshot.data[0]
                                                ['middleName'],
                                            lastName: snapshot.data[0]
                                                ['lastName'],
                                            mobileNumber: snapshot.data[0]
                                                ['mobileNumber'],
                                            passwordCopy: snapshot.data[0]
                                                ['passwordCopy'],
                                          );
                                        } else {
                                          DialogPop.dialogup(
                                              buttontext: "Close",
                                              context: context,
                                              message: "Password Don't match",
                                              onpress: () {
                                                GoRouter.of(context).pop();
                                              });
                                        }
                                      } else {
                                        DialogPop.dialogup(
                                            context: context,
                                            buttontext: "Close",
                                            message:
                                                "Please Confirm the password",
                                            onpress: () {
                                              GoRouter.of(context).pop();
                                            });
                                      }
                                    } else {
                                      return;
                                    }
                                  },
                                  child: const Center(
                                    child: Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                          fontFamily: 'GeneralSansRegular',
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
