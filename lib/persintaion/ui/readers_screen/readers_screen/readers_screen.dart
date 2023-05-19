import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mohafez_elwaheen_student/core/helpers/helper_functions.dart';
import 'package:mohafez_elwaheen_student/core/styls/colors.dart';

import '../../../../core/widgets/texts.dart';
import '../../reader_screen/reader_screen/reader_screenA.dart';

class ReadersScreen extends StatefulWidget {
  final int type;
  const ReadersScreen({required this.type});

  @override
  State<ReadersScreen> createState() => _ReadersScreenState();
}

class _ReadersScreenState extends State<ReadersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.type.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          title: const Text(
            'الرئيسية',
            style: TextStyle(
              fontSize: 28,
              color: Color(0xff433826),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
            softWrap: false,
          )),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (ctx, index) {
              return Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: .2))),
                child: Row(
                  children: [
                    Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            "assets/images/img.png",
                            width: 55,
                            height: 55,
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'محمد ابراهيم',
                          style: TextStyle(
                              fontSize: 28,
                              color: Color(0xff433826),
                              fontWeight: FontWeight.w700,
                              height: .8),
                          textAlign: TextAlign.right,
                          softWrap: false,
                        ),
                        Text(
                          'مصر',
                          style: TextStyle(
                            height: .8,
                            fontSize: 28,
                            color: Color(0xffa7a7a7),
                          ),
                          textAlign: TextAlign.right,
                          softWrap: false,
                        )
                      ],
                    )),
                    GestureDetector(
                      onTap: () {
                        pushPage(context, ReaderScreen());
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          color: const Color(0x330d7f43),
                          borderRadius: BorderRadius.circular(21.0),
                        ),
                        child: const Texts(
                            title: "ابدأ",
                            textColor: Colors.green,
                            fontSize: 20,
                            weight: FontWeight.bold,
                            align: TextAlign.center),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
