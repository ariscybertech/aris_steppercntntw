import 'package:flutter/material.dart';

class StepTwoView extends StatefulWidget {
  StepTwoView({Key key}) : super(key: key);
  
  @override
  _StepTwoViewState createState() => _StepTwoViewState();
}

class _StepTwoViewState extends State<StepTwoView>{

  Widget _myListView(BuildContext context) {
    // backing data
    final listData = ['Data 1', 'Data 2', 'Data 3', 'Data 4', 'Data 5', 'Data 6', 'Data 7'];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(listData[index]),
        );
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            _myListView(context)
          ]
        )
    );
  }
}
