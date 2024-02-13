import 'package:bmi_application_1/bmi_results_screen.dart';
import 'package:bmi_application_1/constants.dart';
import 'package:bmi_application_1/gender_selection_widget.dart';
import 'package:bmi_application_1/weight_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BmiCalculatorScreen extends StatefulWidget {
  BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {

  bool isMale =true;
  int weight = 75 ; 
  int age=29;
  double heeight=130;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: Text("BMI CALCULATOR", 
                    style: TextStyle(
                      color: Colors.white
                      ),
                      ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    isMale=true;
                    setState(() {
                    });
        
                  },
                  child: GenderSelectionWidget(width: width, isMale: true,  backgroundcolor: isMale ? cardColor : backgroundColor,)
                  ),
                GestureDetector(
                  onTap: () {
                    isMale=false;
                    setState(() {
                      
                    });
                  },
                  
                  child: GenderSelectionWidget(width: width, isMale: false, backgroundcolor: !isMale ? cardColor :backgroundColor,)
                ),
                 
              ],
        
            ),

            // Slider vala box
             Row(
                children: [ 
                  Container(
                    width: width*0.969,
                    height: width*0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: cardColor,
                    ),
                    child: Column(
                      children: [
                        Text("Height (in mts.)",style: titleTextStyle,),
                        Text("${heeight.toInt()}",style: titleTextStyle,),
                        
                        //Slider 
                        SliderTheme(
                          data: SliderThemeData().copyWith(
                            overlayColor: Colors.pink.withOpacity(0.5),
                            inactiveTrackColor: Colors.red,
                            activeTrackColor: Colors.green,
                            thumbColor: Colors.pink

                          ),
                          child: Slider(min: 100,max: 200, value: heeight,
                                      onChanged: (value){
                                        heeight=value;
                                        setState(() {        });
                                      },),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            
        
            // Neeche vaale 2 box
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                      
                  // weight vala box
                  WeightWidget(width: width, value: weight, title: "weight", onAddTap: ()=> addSubtractWeight(true),onRemoveTap : ()=> addSubtractWeight(false)),
                      
                  
                  //age vala box
                  WeightWidget(width: width, value: age, title: "Age", onAddTap: ()=> addSubtractAge(true), onRemoveTap : ()=> addSubtractAge(false)),
                      
                ],
              ),
            ),
            // const Spacer(),
            GestureDetector(
              onTap: (){
                final bmi = weight /((heeight/100)*(heeight/100));
                print(bmi);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_)=> ResultScreen(bmi: bmi)),
                );
              },
              child: Container(
                width: width,
                color: Colors.pink,
                height: 80,
                child: Center(
                  child: Text(
                      "Calculated Bmi",
                      style: titleTextStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addSubtractWeight(bool isAdd){
    isAdd ? weight ++ : weight--;
    setState(() {});
  }
  void addSubtractAge(bool isAdd){
    isAdd ? age ++ : age--;
    setState(() {});
  }
}




// class WeightWidget extends StatelessWidget {
//   const WeightWidget({
//     super.key,
//     required this.width,
//     required this.weight,
//   });

//   final double width;
//   final int weight;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width*0.45,
//       height: width*0.45,
//       decoration: BoxDecoration(
//         color: cardColor,
//         borderRadius: BorderRadius.circular(10),
        
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Text("weight",style: titleTextStyle,),
//           Text("$weight",style: titleTextStyle,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               //Button1 Container
//               Container(
//                 width: 75,
//                 height: 75,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: backgroundColor,
//                 ),
//                 child: Icon(Icons.add,color: Colors.white,),
//               ),
    
//               Container(
//                 width: 75,
//                 height: 75,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: backgroundColor,
//                 ),
//                 child: Icon(Icons.remove,color: Colors.white,)
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class GenderSelectionWidget extends StatelessWidget {
//   const GenderSelectionWidget({
//     super.key,
//     required this.width,
//   });

//   final double width;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             FaIcon(
//               FontAwesomeIcons.mars,
//               color: Colors.white,
//               size: 75,
//             ),
//             Text(
//               "male",
//               style: TextStyle(color: Colors.white,fontSize: 25
//               ,fontWeight: FontWeight.bold),)
//           ],
//         ),
        
//         width: width*0.45,
//         height: width*0.45,
//         decoration: BoxDecoration(
//           color: cardColor,
//           borderRadius: BorderRadius.circular(10),
      
//         ),
//       ),
//     );
//   }
// }