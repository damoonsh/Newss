import 'package:flutter/material.dart';

class ButtonHolder extends StatefulWidget {
  ButtonHolder({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _ButtonHolderState createState() => _ButtonHolderState();
}

class _ButtonHolderState extends State<ButtonHolder> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    _counter = 0;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _longPress() {
    for (int i = 0; i < 10; i++) {
      this._incrementCounter();
    }
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center( 
          child: Text(
            widget.text,
            style: TextStyle(fontSize: 32),
          ),
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headline4,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 30),
              backgroundColor: Colors.red[500]
            ),
            onPressed: _decrementCounter,
            child: const Text('Dec', 
            style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 30),
              backgroundColor: Colors.green
            ),
            onPressed: _incrementCounter,
            onLongPress: _longPress,
            child: const Text('Inc', 
            style: TextStyle(color: Colors.black)),
          ),
        ])
      ],
    );
  }
}
