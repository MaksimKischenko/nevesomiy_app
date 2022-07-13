import 'package:flutter/material.dart';
import 'package:nevesomiy_app/styles.dart';

class VerseCard extends StatelessWidget {

  final String verse;

  const VerseCard({
    Key? key,
    required this.verse,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: AppStyle.appCardColor,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: SelectableText(
            verse,
            style: AppStyle.verseTextStyle,
          ),
        ),
      ),
    );
  }
}
