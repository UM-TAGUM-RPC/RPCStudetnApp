import 'package:flutter/material.dart';
import 'package:rpcstudentapp/Constants/Constants.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(
      {Key? key,
      required this.date,
      required this.status,
      required this.statusname})
      : super(key: key);
  final String? date;
  final bool? status;
  final String? statusname;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Current Status:",
                        style: TextStyle(
                          color: Color(0xFF404042),
                          fontFamily: "GeneralSansRegular",
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        status.toString() == "false" ? "Pending" : "Approved",
                        style: const TextStyle(
                          color: Colors.brown,
                          fontFamily: "GeneralSanS",
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        statusname!,
                        style: const TextStyle(
                          color: CtrlColors.red,
                          fontFamily: "GeneralSans",
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        date!,
                        style: const TextStyle(
                          color: CtrlColors.red,
                          fontFamily: "GeneralSans",
                          fontSize: 8,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
