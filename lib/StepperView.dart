import 'package:flutter/material.dart';
import 'package:stepper_content_widget/StepOneView.dart';
import 'package:stepper_content_widget/StepTwoView.dart';


class StepperView extends StatefulWidget {
  StepperView({Key key}) : super(key: key);
  
  @override
  _StepperViewState createState() => new _StepperViewState();
}

class _StepperViewState extends State<StepperView> {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _typeStep(),
      ],
    );
  }

  int currentStep = 0;
  List<Step> spr = <Step>[];
  List<Step> _getSteps() {
    spr = <Step>[
      Step(
        state: _getState(1),
        title: Text("Step 1"),
        content: new Wrap(
          children:<Widget>[
            StepOneView()
          ],
        ),
        isActive: (currentStep == 0 ? true : false)
      ),
      Step(
        title: Text("Step 2"),
        content: new Wrap(
          children:<Widget>[
            StepTwoView()
            ],
        ),
        isActive: (currentStep == 1 ? true : false),
        state: _getState(2),
      )
    ];
    return spr;
  }

  StepState _getState(int i) {
    if (currentStep >= i)
      return StepState.complete;
    else
      return StepState.indexed;
  }
    
  Widget _typeStep() => Container(
    child: Stepper(
      
      controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                currentStep < spr.length - 1 ? currentStep += 1 : currentStep = 0;
              });
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Next'),
          ),
        );
      },
      
      steps: _getSteps(),
      currentStep: currentStep,
      type: StepperType.horizontal,
      onStepTapped: (step) {
        setState(() {
          currentStep = step;
          print(step);
        });
      },
      onStepCancel: () {
        setState(() {
          currentStep > 0 ? currentStep -= 1 : currentStep = 0;
        });
      },
      onStepContinue: () {
        setState(() {
          currentStep < spr.length - 1 ? currentStep += 1 : currentStep = 0;
        });
      },
    ),
  );
  
  
  
}