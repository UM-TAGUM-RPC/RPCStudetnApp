import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';

final password = AutoDisposeStateProvider((ref) => true);
final confirmpassword = AutoDisposeStateProvider((ref) => false);

class EditProfile extends ConsumerWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obs1 = ref.watch(password);
    final obs = ref.watch(confirmpassword);
    final formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xFFF7F7F7),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingLabelStyle: const TextStyle(color: CtrlColors.red),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    labelText: "Firstname",
                    labelStyle: const TextStyle(
                        fontFamily: "GeneralSansRegular",
                        fontSize: 12,
                        color: Color(0xFF404042)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
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
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingLabelStyle: const TextStyle(color: CtrlColors.red),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    labelText: "MiddleName (Optional)",
                    labelStyle: const TextStyle(
                        fontFamily: "GeneralSansRegular",
                        fontSize: 12,
                        color: Color(0xFF404042)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
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
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingLabelStyle: const TextStyle(color: CtrlColors.red),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    labelText: "Last Name",
                    labelStyle: const TextStyle(
                        fontFamily: "GeneralSansRegular",
                        fontSize: 12,
                        color: Color(0xFF404042)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingLabelStyle: const TextStyle(color: CtrlColors.red),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    labelText: "Mobile Number",
                    labelStyle: const TextStyle(
                        fontFamily: "GeneralSansRegular",
                        fontSize: 12,
                        color: Color(0xFF404042)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
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
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xFFF7F7F7),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    floatingLabelStyle: const TextStyle(color: CtrlColors.red),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    labelText: "12-12-1998",
                    labelStyle: const TextStyle(
                        fontFamily: "GeneralSansRegular",
                        fontSize: 12,
                        color: Color(0xFF404042)),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
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
                // constraints: const BoxConstraints.tightFor(
                //   width: 160,
                // ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFFF7F7F7),
                ),
                child: TextFormField(
                  obscureText: obs1,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      floatingLabelStyle:
                          const TextStyle(color: CtrlColors.red),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      labelText: "Password",
                      labelStyle: const TextStyle(
                          fontFamily: "GeneralSansRegular",
                          fontSize: 12,
                          color: Color(0xFF404042)),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                          padding: const EdgeInsets.only(left: 20, right: 20),
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
                  obscureText: obs,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
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
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: SvgPicture.asset(
                          CtrlSvg.lock,
                          height: 18,
                          width: 18,
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          ref.read(confirmpassword.notifier).state = !obs;
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
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
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: const Color(0xFFEC4969),
                        ),
                        onPressed: () {},
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
    );
  }
}
