import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const cardMargin = 12;
const bottomContainerColor = Color(0xFFEB1555);
const cardtextstyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Color(0xFF8D8E98),
);
const boldtextstyle = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.w900,
  color: Color(0xFFE0E0E0),
);

enum Gender {
  male,
  female,
}

class _MyHomePageState extends State<MyHomePage> {
  Color malecardcolor = inactiveCardColor;
  Color femalecardcolor = inactiveCardColor;

  Gender Selectedgender = Gender.male;
  int height = 80;
  int age = 20;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: SafeArea(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Mycard(
                            cardColour: Selectedgender == Gender.male
                                ? activeCardColor
                                : inactiveCardColor,
                            cardChild: cardContent(
                              logo: FontAwesomeIcons.mars,
                              cardtext: 'MALE',
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              Selectedgender = Gender.male;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          child: Mycard(
                            cardColour: Selectedgender == Gender.female
                                ? activeCardColor
                                : inactiveCardColor,
                            cardChild: cardContent(
                              logo: FontAwesomeIcons.venus,
                              cardtext: 'FEMALE',
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              Selectedgender = Gender.female;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Mycard(
                          cardColour: activeCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'HEIGHT',
                                style: cardtextstyle,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      height.toString(),
                                      style: boldtextstyle,
                                    ),
                                    Text(
                                      'cm',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SliderTheme(
                                data: SliderThemeData(
                                    activeTrackColor: Colors.white,
                                    inactiveTrackColor: Colors.grey,
                                    thumbColor: bottomContainerColor,
                                    overlayColor: Color(0x40EB1555),
                                    thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 14,
                                    ),
                                    overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 24,
                                    )),
                                child: Slider(
                                  value: height.toDouble(),
                                  min: 50,
                                  max: 200,
                                  onChanged: (double Newvalue) {
                                    setState(() {
                                      height = Newvalue.round();
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Mycard(
                          cardColour: activeCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: cardtextstyle,
                              ),
                              Text(
                                age.toString(),
                                style: boldtextstyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RawMaterialButton(
                                    constraints: const BoxConstraints(
                                        minWidth: 45, minHeight: 45),
                                    onPressed: () => {
                                      setState(() => {age--})
                                    },
                                    fillColor: Color(0xFF4C4F5E),
                                    shape: const CircleBorder(),
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  RawMaterialButton(
                                    constraints: const BoxConstraints(
                                        minWidth: 45, minHeight: 45),
                                    onPressed: () => {
                                      setState(() => {age++})
                                    },
                                    fillColor: Color(0xFF4C4F5E),
                                    shape: const CircleBorder(),
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Mycard(
                          cardColour: activeCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'WEIGHT',
                                style: cardtextstyle,
                              ),
                              Text(
                                weight.toString(),
                                style: boldtextstyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RawMaterialButton(
                                    constraints: const BoxConstraints(
                                        minWidth: 45, minHeight: 45),
                                    onPressed: () => {
                                      setState(() => {weight--})
                                    },
                                    fillColor: Color(0xFF4C4F5E),
                                    shape: const CircleBorder(),
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  RawMaterialButton(
                                    constraints: const BoxConstraints(
                                        minWidth: 45, minHeight: 45),
                                    onPressed: () => {
                                      setState(() => {weight++})
                                    },
                                    fillColor: Color(0xFF4C4F5E),
                                    shape: const CircleBorder(),
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                      color: Colors.white,
                                      size: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  color: bottomContainerColor,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20),
                  height: 55,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class cardContent extends StatelessWidget {
  final IconData logo;
  final String cardtext;

  cardContent({required this.logo, required this.cardtext});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          logo,
          color: Colors.grey[300],
          size: 62,
        ),
        SizedBox(height: 15),
        Text(
          cardtext,
          style: cardtextstyle,
        ),
      ],
    );
  }
}

class Mycard extends StatelessWidget {
  Mycard({required this.cardColour, required this.cardChild});

  final Color cardColour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(cardMargin.toDouble()),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cardColour,
      ),
      child: cardChild,
    );
  }
}

class Ourbutton extends StatelessWidget {
  Ourbutton({required this.iconsymbol, required this.press});

  final IconData iconsymbol;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints(minWidth: 45, minHeight: 45),
      onPressed: () => {print("hi")},
      fillColor: Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      child: Icon(
        iconsymbol,
        color: Colors.white,
        size: 17,
      ),
    );
  }
}
