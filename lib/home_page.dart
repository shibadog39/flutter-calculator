import 'package:flutter/material.dart'; //imported flutter material package
import 'dart:math';

class HomePage extends StatefulWidget{ // creating a stateful widget
  @override
  State createState() => new HomePageState(); // creating the state
}

class HomePageState extends State<HomePage>{
  var ansStr = "0";
  var processingStr = "0";
  var operator= "";

  String displayedProcessingStr(){
    if(processingStr=='0' && operator == ''){
      return '';
    }

    return processingStr + ' ' + operator;
  }

  @override
  Widget build(BuildContext context) { // creating the widget
    return new Scaffold(
        appBar: new AppBar( //defines the content of the Appbar
          title: new Text("Calculator"),
        ),
        body: Container(
          child: Column( //Since we have multiple children arranged vertically, we are using column
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Equal vertical space between all the children of column
            children: <Widget>[ // the column widget uses the children property
              Container( // Display Container
                constraints: BoxConstraints.expand( // Creating a boxed container
                  height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 100.0,
                ),
                alignment: Alignment.bottomRight, // Aligning the text to the bottom right of our display screen
                color: Colors.white, // Seting the background color of the container
                child: Column(
                  children: <Widget>[
                    Text(
                      displayedProcessingStr(),
                      style: TextStyle( // Styling the text
                          fontSize: 30.0,
                          color: Colors.grey
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      "$ansStr",
                      style: TextStyle( // Styling the text
                          fontSize: 50.0,
                          color: Colors.black
                      ),
                      textAlign: TextAlign.right,
                    )
                  ]
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("9", _nine), // using custom widget _button
                  _button("8", _eight),
                  _button("7", _seven),
                  _button("+", _plus)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("6", _six), // using custom widget _button
                  _button("5", _five),
                  _button("4", _four),
                  _button("-", null)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("3", _three), // using custom widget _button
                  _button("2", _two),
                  _button("1", _one),
                  _button("*", null)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("C", _clear), // using custom widget _button
                  _button("0", _zero),
                  _button("=", _equal),
                  _button("/", null)
                ],
              )
            ],
          ),
        )
    );
  }

  Widget _button (String number, Function() f){ // Creating a method of return type Widget with number and function f as a parameter
    return MaterialButton(
      height: 100.0,
      child: Text(number,
          style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.grey[100])),
      onPressed: f,
    );
  }

  void _zero(){ _setPushedNumber('0'); }
  void _one(){ _setPushedNumber('1'); }
  void _two(){ _setPushedNumber('2'); }
  void _three(){ _setPushedNumber('3'); }
  void _four(){ _setPushedNumber('4'); }
  void _five(){ _setPushedNumber('5'); }
  void _six(){ _setPushedNumber('6'); }
  void _seven(){ _setPushedNumber('7'); }
  void _eight(){ _setPushedNumber('8'); }
  void _nine(){ _setPushedNumber('9'); }
  void _setPushedNumber(String number){
    String newNumber = '0';
    if(ansStr == '0'){
      newNumber = number;
    } else {
      newNumber = ansStr + number;
    }
    setState((){ansStr=newNumber;});
  }

  void _clear(){
    setState((){
      ansStr='0';
      processingStr='0';
      operator='';
    });

  }
  void _plus(){
      setState((){
        processingStr=ansStr;
        ansStr='0';
        operator='+';
      });
  }
  void _equal(){
    switch(operator) {
      case '+': {
        setState((){
          ansStr = (int.parse(ansStr) + int.parse(processingStr)).toString();
          processingStr = '0';
          operator='';
        });
      }
      break;
    }
  }

}