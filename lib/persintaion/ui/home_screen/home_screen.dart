import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mohafez_elwaheen_student/core/helpers/helper_functions.dart';
import 'package:mohafez_elwaheen_student/persintaion/ui/readers_screen/readers_screen/readers_screen.dart';

import '../../../core/styls/colors.dart';
import '../../../core/widgets/texts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Expanded(
              child: Image.asset(
            "assets/images/back.png",
            fit: BoxFit.cover,
          )),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: const BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 45,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.language,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Texts(
                              title: "اللغة  Language",
                              textColor: Colors.black,
                              fontSize: 16,
                              weight: FontWeight.bold,
                              align: TextAlign.center),
                        ],
                      ),
                      Row(
                        children: const [
                          Texts(
                              title: "العربية",
                              textColor: Colors.green,
                              fontSize: 16,
                              weight: FontWeight.bold,
                              align: TextAlign.center),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.green,
                            size: 18,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    showDialogWidget(context);
                  },
                  child: Container(
                    width: 100,
                    height: 128,
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0f000000),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration: const BoxDecoration(
                            color: Color(0xff4160a8),
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                          ),
                          child: Center(
                            child: SvgPicture.asset("assets/icons/reading.svg"),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Texts(
                            title: "اقرأ",
                            textColor: Colors.black,
                            fontSize: 22,
                            weight: FontWeight.bold,
                            align: TextAlign.center),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //       horizontal: 20, vertical: 10),
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xffe0ddd6),
                    //     borderRadius: BorderRadius.circular(21.0),
                    //   ),
                    //   child: const Texts(
                    //       title: "الاعدادت",
                    //       textColor: Colors.black,
                    //       fontSize: 14,
                    //       weight: FontWeight.bold,
                    //       align: TextAlign.center),
                    // ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    GestureDetector(
                      onTap: () {
                        showDialogWidget(context);
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          color: const Color(0xffe0ddd6),
                          borderRadius: BorderRadius.circular(21.0),
                        ),
                        child: const Texts(
                            title: "ابدأ",
                            textColor: Colors.black,
                            fontSize: 20,
                            weight: FontWeight.bold,
                            align: TextAlign.center),
                      ),
                    ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    // Container(
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 20, vertical: 10),
                    //     decoration: BoxDecoration(
                    //       color: const Color(0xffe0ddd6),
                    //       borderRadius: BorderRadius.circular(21.0),
                    //     ),
                    //     child: const Texts(
                    //         title: "من نحن ",
                    //         textColor: Colors.black,
                    //         fontSize: 14,
                    //         weight: FontWeight.bold,
                    //         align: TextAlign.center)),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }

  void showDialogWidget(BuildContext context) {
    int status = 1;
    int currentIndex = 1;
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.all(20),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          // contentPadding: EdgeInsets.only(top: 10.0),
          // title: const Text('AlertDialog Title'),
          content: StatefulBuilder(builder: (BuildContext context,
              void Function(void Function()) setStateDialog) {
            return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: status == 1
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "ملاحظة",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          const Text(
                              'تستطيع من خلال ايقونة اقرأ التسميع والحفظ مع الشيخ الذى تريده',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  height: 1.2,
                                  fontSize: 28,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              status++;
                              setStateDialog(
                                () {},
                              );
                            },
                            child: Container(
                              height: 50,
                              width: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xffe0ddd6),
                                borderRadius: BorderRadius.circular(21.0),
                              ),
                              child: const Texts(
                                  title: "التالى",
                                  textColor: Colors.black,
                                  fontSize: 20,
                                  weight: FontWeight.bold,
                                  align: TextAlign.center),
                            ),
                          ),
                        ],
                      )
                    : Column(mainAxisSize: MainAxisSize.min, children: [
                        const Text(
                          "هل أنت ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                currentIndex = 1;
                                setStateDialog(
                                  () {},
                                );
                              },
                              child: Column(
                                children: [
                                  SvgPicture.asset(currentIndex == 1
                                      ? "assets/icons/man_s.svg"
                                      : "assets/icons/man.svg"),
                                  Texts(
                                      title: "طالب",
                                      textColor: currentIndex == 1
                                          ? Colors.black
                                          : Color(0xffA7A7A7),
                                      fontSize: 20,
                                      weight: FontWeight.bold,
                                      align: TextAlign.center),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                currentIndex = 2;
                                setStateDialog(
                                  () {},
                                );
                              },
                              child: Column(
                                children: [
                                  SvgPicture.asset(currentIndex == 2
                                      ? "assets/icons/woman_s.svg"
                                      : "assets/icons/woman.svg"),
                                  Texts(
                                      title: "طالبة",
                                      textColor: currentIndex == 2
                                          ? Colors.black
                                          : Color(0xffA7A7A7),
                                      fontSize: 20,
                                      weight: FontWeight.bold,
                                      align: TextAlign.center),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pop(context);
                                pushPage(
                                    context, ReadersScreen(type: currentIndex));
                              },
                              child: Container(
                                height: 50,
                                width: 120,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color(0xffe0ddd6),
                                  borderRadius: BorderRadius.circular(21.0),
                                ),
                                child: const Texts(
                                    title: "متابعة",
                                    textColor: Colors.black,
                                    fontSize: 20,
                                    weight: FontWeight.bold,
                                    align: TextAlign.center),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                pop(context);
                              },
                              child: Container(
                                height: 50,
                                width: 120,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey, width: .8),
                                  borderRadius: BorderRadius.circular(21.0),
                                ),
                                child: const Texts(
                                    title: "الغاء",
                                    textColor: Colors.black,
                                    fontSize: 20,
                                    weight: FontWeight.bold,
                                    align: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                      ]));
          }),
        );
      },
    );
  }
}
