


import 'package:bmi_application_1/constants.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.bmi});

  final double bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("BMI Result",style: titleTextStyle,),
      ),
      body: Center(
        child: Column(
        
          children: [
            Text("${bmi.toStringAsFixed(2)}",style: titleTextStyle.copyWith(fontSize: 50),),
          
          ],
        ),
      ),
    );
  }
}