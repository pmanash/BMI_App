import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = '';
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber, accentColor: Colors.purple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI_Calculator'),
        ),
        body: Card(
          margin: EdgeInsets.all(15),
          child: Column(children: [
            Text('BMI',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700)),
            TextField(
              controller: wtController,
              decoration: InputDecoration(
                label: Text('Enter your weiht'),
                prefixIcon: Icon(Icons.line_weight),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              controller: ftController,
              decoration: InputDecoration(
                label: Text('Enter your Height(in ft)'),
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              controller: inController,
              decoration: InputDecoration(
                label: Text('Enter your Height(in inch'),
                prefixIcon: Icon(Icons.height),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 11,
            ),
            ElevatedButton(
                onPressed: () {
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();
                  if (wt != '' && ft != '' && inch != '') {
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iinch = int.parse(inch);

                    var tInch = (ift * 12) + iinch;
                    var tcm = tInch * 2.54;
                    var tM = tcm / 100;

                    var bmi = iwt / (tM * tM);
                    var msg ='';
                    
                    if(bmi>25){
                      msg= "You'r over Weight! ";
                    }
                    else if(bmi<18){
                      msg= "You'r under Weight! ";

                    }
                    else {
                      msg= "You'r healthy Person! ";
                    }

                    setState(() {
                      result = 'Yout BMI is ${bmi.toStringAsFixed(2)} \n $msg';
                    });
                  } else {
                    setState(() {
                      result = ('Please fill all required blanks! ');
                    });
                  }
                },
                child: Text(
                  'calculate',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            Text(result,
                style: TextStyle(fontSize: 20, 
                fontWeight: FontWeight.bold))
          ]),
        ),
      ),
    ));
  }
}
