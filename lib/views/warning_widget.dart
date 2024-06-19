import 'package:flutter/material.dart';
import 'package:laywer_desk/views/widgets.dart';

import '../styles.dart';

class WarningWidget extends StatelessWidget {
  const WarningWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
        showAsGradientBorder: true,
        child: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset("assets/warning.png"),
            ),
            horizontalSpace10,
            Expanded(child: RichText(
              text: const TextSpan(
                  text: "Important:",
                  style: SmallTextStyle(isBold: true, color: Colors.black87),
                  children: [
                    TextSpan(
                        text: "This output is not legal advice & should be reviewed by an expert lawyer before use",
                        style: SmallTextStyle(color: Colors.black54)
                    )
                  ]
              ),
            ))
          ],
        ));
  }
}