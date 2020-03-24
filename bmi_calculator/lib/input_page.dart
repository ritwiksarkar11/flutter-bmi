import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'roundiconbutton.dart';
import 'result_page.dart';
import 'bmilogic.dart';
enum Gender{
  male,
  female,
}



class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height =120;
  int weight = 50;
  int age =20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender =Gender.male;
                    });
                  },
                  child: ReusableCard(
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',

                    ),
                    colour: selectedGender==Gender.male?kActiveCardColour:kInactiveCardColour,
                  ),
                ),
              ),
              Expanded(
                child:GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedGender =Gender.female;
                    });
                  },
                  child: ReusableCard(
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    colour: selectedGender==Gender.female?kActiveCardColour:kInactiveCardColour,
                  ),
                ),
              ),
            ],
          )),
          Expanded(child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT',style: kLabelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic, // to put height and cm on same line
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                Slider(
                  min: 120.0,
                  max: 220.0,
                  activeColor: kBottomContainerColour,
                  inactiveColor: kActiveCardColour,
                  value: height.toDouble(),
                  onChanged: (double newValue) {
                      setState(() {
                     height = newValue.round();
                    });
                 },

                ),

              ],
            ),
            
            colour: kInactiveCardColour,
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child:ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT',style: kLabelTextStyle,),
                      Text(weight.toString(),style: kNumberTextStyle),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  colour: kInactiveCardColour,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE',style: kLabelTextStyle,),
                      Text(age.toString(),style: kNumberTextStyle),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  colour: kInactiveCardColour,
                ),
              ),
            ],
          ),),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc =
              CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
    },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',style: kBodyTextStyle,
                ),
              ),
              margin: EdgeInsets.only(top: 10.0),
              color: kBottomContainerColour,
              width: double.infinity,
              height: 60.0,
            ),
          ),
         ],
      ),

    );
  }
}

