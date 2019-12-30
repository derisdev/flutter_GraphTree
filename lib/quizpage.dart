import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matdis/resultpage.dart';

class GetJson extends StatelessWidget {
  
  String assettoload;

  setasset() {
      assettoload = "asset/soal.json";
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload, cache: true),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return QuizPage(mydata: mydata);
        }
      },
    );
  }
}

class QuizPage extends StatefulWidget {
  final mydata;

  QuizPage({Key key, @required this.mydata}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState(mydata);
}

class _QuizPageState extends State<QuizPage> {
  var mydata;
  _QuizPageState(this.mydata);

  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.greenAccent;
  Color wrong = Colors.red;
  Icon trueIcon = Icon(Icons.check, color: Colors.white,);
  Icon falseIcon = Icon(Icons.close, color: Colors.white,);
  Icon checkIcon = Icon(Icons.check, color: Colors.white,);

  int hitungBenar = 0;
  int marks = 0;
  int i = 1;
  int j = 1;
  int timer = 30;
  String showtimer = "30";

  Map<String, Color> btncolor = {
    "a": Colors.indigoAccent,
    "b": Colors.cyan,
    "c": Colors.orange,
    "d": Colors.pink,
  };

  Map<String, Icon> iconCheck = {
    "a": null,
    "b": null,
    "c": null,
    "d": null
  };

  bool canceltimer = false;
  bool checked = false;


  var random_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  void initState() {
    starttimer();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 30;
    setState(() {
      if (j < 10) {
        i = random_array[j];
        j++;
        checked = false;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultPage(marks: marks, hitungBenar: hitungBenar,),
        ));
      }
      btncolor["a"] = Colors.indigoAccent;
      btncolor["b"] = Colors.cyan;
      btncolor["c"] = Colors.orange;
      btncolor["d"] = Colors.pink;

      iconCheck["a"] = null;
      iconCheck["b"] = null;
      iconCheck["c"] = null;
      iconCheck["d"] = null;
    });
    starttimer();
  }

  void checkanswer(String k) {
    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks = marks + 10;
      hitungBenar++;
      colortoshow = right;
      setState(() {
       checkIcon = trueIcon; 
      });
    } else {
      colortoshow = wrong;
      setState(() {
      checkIcon = falseIcon;
      });
    }
    setState(() {
      btncolor[k] = colortoshow;
      canceltimer = true;
      checked = true;
      iconCheck[k] = checkIcon;

    });

    Timer(Duration(seconds: 1), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 1.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: ListTile(
          leading: checked? iconCheck[k] : null,
          title: Text(
          mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: MediaQuery.of(context).size.width,
        height: 60.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Kuis",
                  ),
                  content: Text("Kamu tidak bisa meninggalkan halaman ini."),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                      ),
                    )
                  ],
                ));
      },
      child: Scaffold(
        backgroundColor: Color(0xff1E2736),
        body: Column(
          children: <Widget>[
            SizedBox(height: 25.0,),
            mydata[3][i.toString()] == 'noimage'? SizedBox(height: 0.0) : Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Image.asset(mydata[3][i.toString()]),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    mydata[0][i.toString()],
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: "Quando",
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choicebutton('a'),
                    choicebutton('b'),
                    choicebutton('c'),
                    choicebutton('d'),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    showtimer,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Times New Roman',
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}