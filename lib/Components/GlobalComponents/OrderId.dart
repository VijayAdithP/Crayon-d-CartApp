import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text1;
  final String text2;
  const HeaderText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.clip,
      textAlign: TextAlign.end,
      textDirection: TextDirection.ltr,
      softWrap: true,
      maxLines: 1,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: text1,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: text2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
