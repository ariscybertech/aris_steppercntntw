import 'package:flutter/material.dart';

class StepOneView extends StatefulWidget {
  StepOneView({Key key}) : super(key: key);
  
  @override
  _StepOneViewState createState() => _StepOneViewState();
}

class _StepOneViewState extends State<StepOneView>{
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            new TextFormField(
              decoration: const InputDecoration(labelText: 'Text 1'),
              keyboardType: TextInputType.number,
            ),
            new TextFormField(
              decoration: const InputDecoration(labelText: 'Text 2'),
              keyboardType: TextInputType.number,
            ),
            
          ],
        ),
    );
  }
}
