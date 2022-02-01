
import 'dart:math';

import 'package:bmi_calculator/IconChanger.dart';
import 'package:bmi_calculator/MeasureCard.dart';
import 'package:bmi_calculator/ReusableCard.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedGender = 1;
  int weight = 40;
  int height = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ReusableCard(
            cardChild: IconChanger(icon: Icons.male, title: 'Male',
          active: selectedGender==0), onPress: (){setState(() {
            selectedGender=0;

              });

              }),
                ReusableCard(cardChild: IconChanger(icon: Icons.female, title: 'Female',
                    active: selectedGender==1), onPress: () {
                  setState(() {
                    selectedGender = 1;
                  });

                })




            ],
          ),
          Row(
            children: [
              ReusableCard(cardChild: MeasureCard(
                measure: weight, title:'Weight' , unit:'kg' , increment: (){
                  setState(() {
                    weight ++;
                  });
              },decrement:(){
                  setState(() {
                    weight--;
                  });
              } ,
              ), onPress: () {}),
              ReusableCard(cardChild: MeasureCard(
                measure: height, title:'Height' , unit:'cm' , increment: (){
                  setState(() {
                    height++;
                  });
              },decrement:(){
                  setState(() {
                    height--;
                  });
              } ,
              ), onPress: () {}),

            ],
          ),
          GestureDetector(
            onTap: (){
              double bmi = weight / pow(height/100,2);
              String bmiString = bmi.toStringAsFixed(2);
              print(bmiString);

              String getResult() {
                if (bmi >= 25) {
                  return 'Overweight';
                } else if (bmi > 18.5) {
                  return 'Healthy';
                } else {
                  return 'Underweight';
                }
              }


              showDialog(context: context, builder: (BuildContext context ) {
                return AlertDialog(
                  title: Text('Your Bmi is $bmiString \n' +getResult(), style: TextStyle(fontSize: 25)

                   ),


                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text('Back'))
                  ],
                );

              });

            },
            child: Container(
              color: Colors.pink,
              width: double.infinity,
              height: 70,
              child: Center(
                child: Text('Calculate',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),

            ),
          )
        ],
      )

    );
  }
}
