import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _currentItemSelected = '+';
  List<String> _operator = ['+','-','*','/'];
  double nmr1 = 0.0, nmr2 = 0.0, nmr3 = 0.0,
         dnm1 = 0.0, dnm2 = 0.0, dnm3 = 0.0,
         result = 0.0;
  final TextEditingController _numerator1 = TextEditingController();
  final TextEditingController _numerator2 = TextEditingController();
  final TextEditingController _denominator1 = TextEditingController();
  final TextEditingController _denominator2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('FRACTION CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Flexible(
                child: Padding(
                padding: EdgeInsets.fromLTRB(10, 30, 50, 50),
                child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                fillColor: Colors.black,
                hintText: 'Numerator 1'
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _numerator1,
              ),
              ),
              ),
              Flexible(
                child: Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 50, 50),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                fillColor: Colors.black,
                hintText: 'Numerator 2'
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _numerator2,
              ),
              ),) 
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 50, 0),
                    child: Text('=================='),
                    )
                    ),
                    Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 50, 0),
                    child: Text('=================='),
                    )
                    )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Padding(
                      padding: EdgeInsets.all(1),
                      //drop down box for operator
                      child: DropdownButton<String>(
                        items: _operator.map((String dropdownStringItem){
                          return DropdownMenuItem<String>(
                            value: dropdownStringItem,
                            child: Text(dropdownStringItem,
                            style: TextStyle(fontSize: 30.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                            
                            ),
                            ),
                          );
                        }
                        ).toList(), 
                        onChanged: (String newValueSelected) {
                          _onDropdownSelectedItem(newValueSelected);
                          },
                          value: _currentItemSelected,                        
                                                ),
                                              )
                                              )
                                          )
                                        ],
                                      ),
                                        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Flexible(
              child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 50, 0),
              child: TextField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.black,
              hintText: 'Denominator 1'
              ),
              keyboardType: TextInputType.numberWithOptions(),
              controller: _denominator1,
              ),
              ),
              ),
              Flexible(child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 50, 0),
              child: TextField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.black,
              hintText: 'Deniminator 2'
              ),
              keyboardType: TextInputType.numberWithOptions(),
              controller: _denominator2,
              ),
              ),
              ) 
              ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: MaterialButton(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)
                    )),
                    elevation: 5.0, 
                    minWidth: 150.0,
                    height: 50,
                    color: Colors.blueAccent,
                    splashColor: Colors.blueGrey,
                    child: 
                    Text('CALCULATE',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.cyanAccent,
                      fontWeight: FontWeight.w800,
                    )
                    ),
                     onPressed: _onPressed, 
                                        
                                      ),
                                      ),
                                    ],
                                  ),
                    
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(0),
                                        child: MaterialButton(shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)
                                        )),
                                        elevation: 5.0, 
                                        minWidth: 150.0,
                                        height: 50,
                                        color: Colors.blueAccent,
                                        splashColor: Colors.blueGrey,
                                        child: 
                                        Text('RESET',
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          color: Colors.cyanAccent,
                                          fontWeight: FontWeight.w800,
                                        )
                                        ),
                                        onPressed:_reset,
                                          ),
                                        ),
                                        ],
                                        ),
                                                            
              Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Padding(
                  padding: 
                  EdgeInsets.all(10),
                  child: Text('Result:',
                  style: TextStyle(
                  fontSize: 30.0
                  ),
                 ),
                 ),
                Padding(
                padding: EdgeInsets.all(5),
                child: Text("$nmr3",
                style: TextStyle(fontSize: 30.0),
                ),
              ),
              Padding(
             padding: 
            EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Text('______________'),
           ),
             Padding(
             padding: EdgeInsets.all(5),
             child: Text("$dnm3",
             style: TextStyle(fontSize: 30.0),
            ),
            ),
            ],
            )
                                                            
                                                                                                  
                                                                                                  
            ]
            ),
                                                                                                
            ),
            );
            }
                                                                                      
    void _onDropdownSelectedItem(String newValueSelected) {
          setState(() {
          this._currentItemSelected = newValueSelected;
          });
        }
                                                            
    void _onPressed() {
          setState(() {
          nmr1 = double.parse(_numerator1.text);
          nmr2 = double.parse(_numerator2.text);
          dnm1 = double.parse(_denominator1.text);
          dnm2 = double.parse(_denominator2.text);
                                        
          if (_currentItemSelected == '+'){
             dnm3 = gcd(dnm1,dnm2);
             nmr3 = (nmr1*dnm2) + (dnm1*nmr2);
             dnm3 = dnm1*dnm2;
            }
                                        
          else if(_currentItemSelected == '-'){
            dnm3 = gcd(dnm1,dnm2);
            nmr3 = (nmr1*dnm2) - (dnm1*nmr2);
            dnm3 = dnm1*dnm2;
            }
                       
          else if(_currentItemSelected == '*'){
            dnm3 = gcd(dnm1,dnm2);
            dnm3 = nmr1*nmr2;
            dnm3 = dnm1*dnm2;
            }
                                       
          else if(_currentItemSelected == '/'){
            dnm3 = gcd(dnm1,dnm2);
            nmr3 = nmr1*dnm2;
            dnm3 = dnm1*nmr2;
            }
           simplestForm();
          });
        }
                                                                            
    double gcd(double a, double b) {
          if (a == 0){
           return b;
          }
          else{
           return gcd(b % a,a);
          }
        }
                                                
    void simplestForm() {
    double comFactor = gcd(nmr3,dnm3);
           nmr3 = nmr3/comFactor;
           dnm3 = dnm3/comFactor;
         }
                                       
    void _reset() {
      setState(() {
        _numerator1.text = "";
        _numerator2.text = "";
        _denominator1.text = "";
        _denominator2.text = "";
        nmr3 = 0.0;
        dnm3 = 0.0;
        
      });
  }
}