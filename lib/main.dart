import 'package:flutter/material.dart';
import 'package:laywer_desk/models/agreement.dart';
import 'package:laywer_desk/models/research_result.dart';
import 'package:laywer_desk/styles.dart';
import 'package:laywer_desk/views/agreement_writer_screen.dart';
import 'package:laywer_desk/views/research_results_screen.dart';
import 'package:laywer_desk/views/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lawyer Desk',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: "PlusJakartaSans"),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const GradientWidget(
            child: Center(
                child: Text(
          "Layer Desk",
          style: LargeTextStyle(isBold: true),
        ))),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientButton(
                label: "Research Results",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResearchResultsScreen(
                                researchResult: ResearchResult.sample,
                              )));
                }),
            const SizedBox(
              height: 20,
            ),
            GradientButton(
                label: "Agreement writer",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AgreementWriterScreen(
                                agreement: Agreement.sample,
                              )));
                })
          ],
        ),
      ),
    );
  }
}
