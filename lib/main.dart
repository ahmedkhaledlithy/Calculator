import 'package:flutter/material.dart';

void main() {
  runApp(Calc());
}

class Calc extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController numberController1 = TextEditingController();
  TextEditingController numberController2 = TextEditingController();
  var result;

  @override
  void dispose() {
    numberController1.dispose();
    numberController2.dispose();
    super.dispose();
  }

  @override
  void initState() {
    result = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 24.0),
                child: Text(
                 "Result : " + result.toString(),
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                controller: numberController1,
                decoration: InputDecoration(labelText: "Number 1"),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: numberController2,
                decoration: InputDecoration(labelText: "Number 2"),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        add(double.parse(numberController1.text), double.parse(numberController2.text),);
                      });
                    },
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 28),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        subtract(double.parse(numberController1.text),
                            double.parse(numberController2.text));
                      });
                    },
                    child: Text(
                      "-",
                      style: TextStyle(fontSize: 28),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        multiply(double.parse(numberController1.text),
                            double.parse(numberController2.text));
                      });
                    },
                    child: Text(
                      "*",
                      style: TextStyle(fontSize: 28),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        div(double.parse(numberController1.text),
                            double.parse(numberController2.text));
                      });
                    },
                    child: Text(
                      "/",
                      style: TextStyle(fontSize: 28),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  add(double num1, double num2) {
    result = num1 + num2;
    return result;
  }

  subtract(double num1, double num2) {
    result = num1 - num2;
    return result;
  }

  multiply(double num1, double num2) {
    result = num1 * num2;
    return result;
  }

  div(double num1, double num2) {
    result = num1 / num2;
    return result;
  }
}
