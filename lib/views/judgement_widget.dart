import 'dart:math';

import 'package:flutter/material.dart';
import 'package:laywer_desk/models/research_result.dart';
import 'package:laywer_desk/styles.dart';
import 'package:laywer_desk/views/widgets.dart';

class JudgementWidget extends StatelessWidget {
  const JudgementWidget({super.key, required this.judgement});
  final Judgement judgement;

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
        showAsGradientBorder: true,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              ExpandableWidget(
                  title: judgement.title,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Final Judgement",
                        style: MediumTextStyle(isBold: true),
                      ),
                      verticalSpace10,
                      RichText(
                          text: TextSpan(
                        text: judgement.finalJudgement.substring(0, min(judgement.finalJudgement.length,400)),
                        style: const SmallTextStyle(color: Colors.black54),
                            children: const [
                              TextSpan(text: " - Read more", style: SmallTextStyle(color: blue, isBold: true))
                            ]
                      )),
                      verticalSpace10,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.orange.shade100
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Row(
                          children: [
                            Icon(Icons.file_present, color: Colors.pink,),
                            horizontalSpace10,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Case document.pdf", style: SmallTextStyle(color: Colors.black87),),
                                  const SizedBox(height: 5,),
                                  Text("1000 kb. 12 pages", style: TextStyle(fontSize: 12),)
                                ],
                              ),
                            ),
                            IconButton(onPressed: (){}, icon: Icon(Icons.file_download_rounded))
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }
}

class ExpandableWidget extends StatefulWidget {
  const ExpandableWidget(
      {super.key,
      required this.title,
      required this.child,
      this.initiallyExpanded = false});
  final String title;
  final Widget child;
  final bool initiallyExpanded;

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  late bool isExpanded;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: (){
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Row(
            children: [
              Expanded(
                  child: isExpanded
                      ? GradientWidget(
                          child: Text(
                            widget.title,
                            style: const MediumTextStyle(isBold: true),
                          ),
                        )
                      : Text(
                          widget.title,
                          style: const MediumTextStyle(isBold: true),
                        )),
              Column(
                children: [
                  horizontalSpace10,
                  GradientWidget(
                      child: Icon(isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down)),
                ],
              )
            ],
          ),
        ),
        isExpanded
        ? Column(
          children: [
            verticalSpace20,
            widget.child,
          ],
        ) : const SizedBox()
      ],
    );
  }
}
