

import 'package:bmi_application_1/bmi_calculator_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
   BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home: BmiCalculatorScreen(),
    );
    
  }
}