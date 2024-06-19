import 'package:flutter/material.dart';
import 'package:laywer_desk/models/research_result.dart';
import 'package:laywer_desk/styles.dart';
import 'package:laywer_desk/views/judgement_widget.dart';
import 'package:laywer_desk/views/warning_widget.dart';
import 'package:laywer_desk/views/widgets.dart';

class ResearchResultsScreen extends StatelessWidget {
  const ResearchResultsScreen({super.key, required this.researchResult});
  final ResearchResult researchResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(240),
      appBar: AppBar(
        title: const GradientWidget(
          child: Text(
            'Research Results',
            style: LargeTextStyle(isBold: true),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
        child: Column(
          children: [
            // verticalSpace20,
            const WarningWidget(),
            verticalSpace20,
            Expanded(
              child: ResearchResultsView(researchResult: researchResult),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration:
            const BoxDecoration(shape: BoxShape.circle, gradient: gradient),
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(8),
        child: const Icon(
          Icons.file_present,
          color: Colors.white,
          size: 48,
        ),
      ),
    );
  }
}

class ResearchResultsView extends StatefulWidget {
  const ResearchResultsView({super.key, required this.researchResult});
  final ResearchResult researchResult;

  @override
  State<ResearchResultsView> createState() => _ResearchResultsViewState();
}

class _ResearchResultsViewState extends State<ResearchResultsView> {
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: tabIndex,
      length: 6,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RotatedBox(
            quarterTurns: 1,
            child: SizedBox(
              height: 38,
              child: TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  indicatorColor: Colors.white.withAlpha(240),
                  dividerHeight: 0,
                  padding: const EdgeInsets.all(0),
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.zero,
                  onTap: (index) {
                    setState(() {
                      tabIndex = index;
                    });
                  },
                  tabs: [
                    TabItemView(tabIndex: tabIndex, itemIndex: 0),
                    TabItemView(tabIndex: tabIndex, itemIndex: 1),
                    TabItemView(tabIndex: tabIndex, itemIndex: 2),
                    TabItemView(tabIndex: tabIndex, itemIndex: 3),
                    TabItemView(tabIndex: tabIndex, itemIndex: 4),
                    TabItemView(tabIndex: tabIndex, itemIndex: 5),
                  ]),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: TabBarView(
              children: [
                SingleChildScrollView(
                    child: Text(widget.researchResult.description)),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.researchResult.actsAndLaws.map((act) {
                      return Text(
                        "* ${act}",
                        style: const MediumTextStyle(isBold: true),
                      );
                    }).toList(),
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      "Judgements",
                      style:
                          MediumTextStyle(isBold: true, color: Colors.black87),
                    ),
                    verticalSpace10,
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children:
                            widget.researchResult.judgements.map((judgement) {
                          return Column(
                            children: [
                              JudgementWidget(judgement: judgement),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          );
                        }).toList(),
                      ),
                    ))
                  ],
                ),
                SingleChildScrollView(
                    child: Text(widget.researchResult.templates)),
                SingleChildScrollView(
                    child: Text(widget.researchResult.questions)),
                SingleChildScrollView(
                    child: Text(
                        "${widget.researchResult.evidences} \n ${widget.researchResult.evidences}"))
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class TabItemView extends StatelessWidget {
  const TabItemView(
      {super.key, required this.tabIndex, required this.itemIndex});
  final int tabIndex;
  final int itemIndex;

  String getTabLabel() {
    switch (itemIndex) {
      case 0:
        return "Description";
      case 1:
        return "Acts & Laws";
      case 2:
        return "Judgement";
      case 3:
        return "Templates";
      case 4:
        return "Questions";
      default:
        return "Evidences";
    }
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 2,
      child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Colors.white,
              gradient: itemIndex == tabIndex ? gradient : null),
          child: Text(
            getTabLabel(),
            style: itemIndex != tabIndex
                ? const SmallTextStyle(color: Colors.black54)
                : const SmallTextStyle(color: Colors.white, isBold: true),
          )),
    );
  }
}
