import 'package:flutter/material.dart';
import 'package:laywer_desk/models/agreement.dart';
import 'package:laywer_desk/styles.dart';
import 'package:laywer_desk/views/warning_widget.dart';
import 'package:laywer_desk/views/widgets.dart';

class AgreementWriterScreen extends StatelessWidget {
  const AgreementWriterScreen({super.key, required this.agreement});
  final Agreement agreement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agreement Writer", style: MediumTextStyle(color: Colors.white),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: lightGradient
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
        ),
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.info_outline, color: Colors.white,))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: lightGradient
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.yellow.shade600,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("Your Document is Ready", style: MediumTextStyle(color: Colors.black87, isBold: true)
                        ,),
                    ),
                  ],
                ),
              ),
              verticalSpace10,
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.only(top: 16, left: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                        // boxShadow: [
                        //   BoxShadow(
                        //       offset: Offset(2, 2),
                        //       color: Colors.grey.shade300,
                        //       blurRadius: 16
                        //   )
                        // ]
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Your Document is Ready", style: MediumTextStyle(color: Colors.black87, isBold: true)
                            ,),
                        ),
                        StatementsWidget(statements: agreement.statements)
          
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16, right: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(4, 4),
                            color: Colors.grey.shade300,
                            blurRadius: 2
                        )
                      ]
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text("Your Document is Ready", style: MediumTextStyle(color: Colors.black87, isBold: true)
                            ,),
                        ),
                        StatementsWidget(statements: agreement.statements)
                      ],
                    ),
                  )
                ],
              ),
              verticalSpace10,
              const WarningWidget(),
              const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 82,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: lightGradient
        ),
        child: Row(
          children: [
            Expanded(child: Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white)
                ),
                onPressed: (){},
                child: const Text("Answer Q & A", style: MediumTextStyle(color: Colors.white),),),
            )),
            Expanded(child: Center(
              child: ElevatedButton(
                style:  ButtonStyle(
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),
    ),),),
                onPressed: (){},
                child: const GradientWidget(child: Text("View first draft", style: MediumTextStyle(),)),),
            ))
          ],
        ),
      ),
    );
  }
}

class StatementsWidget extends StatelessWidget {
  const StatementsWidget({super.key, required this.statements});
  final List<Statement> statements;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: statements.map((statement){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(statement.title, style: const SmallTextStyle(isBold: true),),
            verticalSpace10,
            Text(statement.description, style: const SmallTextStyle(),),
            verticalSpace10
          ],
        );
      }).toList(),
    );
  }
}

