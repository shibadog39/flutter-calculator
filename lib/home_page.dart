import 'package:flutter/material.dart'; //imported flutter material package

class HomePage extends StatefulWidget{ // creating a stateful widget
  @override
  State createState() => new HomePageState(); // creating the state
}

class HomePageState extends State<HomePage>{
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
                child: Text(
                  "0",
                  style: TextStyle( // Styling the text
                      fontSize: 50.0,
                      color: Colors.black
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("9", null), // using custom widget _button
                  _button("8", null),
                  _button("7", null),
                  _button("+", null)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("6", null), // using custom widget _button
                  _button("5", null),
                  _button("4", null),
                  _button("-", null)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("3", null), // using custom widget _button
                  _button("2", null),
                  _button("1", null),
                  _button("*", null)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _button("C", null), // using custom widget _button
                  _button("0", null),
                  _button("=", null),
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
}