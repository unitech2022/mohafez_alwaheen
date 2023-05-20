import 'package:flutter/cupertino.dart';
import 'package:mohafez_elwaheen_student/core/widgets/texts.dart';

class ListEmptyWidget extends StatelessWidget {
  final String title;
  final Color textColor;
  const ListEmptyWidget({super.key, required this.textColor, required this.title});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Texts(
            title: title,
            textColor: textColor,
            fontSize: 16,
            weight: FontWeight.bold,
            align: TextAlign.center));
  }
}