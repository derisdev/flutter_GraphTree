import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultPage extends StatefulWidget {
  final int marks;
  final int hitungBenar;
  ResultPage({Key key, @required this.marks, @required this.hitungBenar})
      : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState(marks, hitungBenar);
}

class _ResultPageState extends State<ResultPage> {
  List<String> images = [
    "image/success.png",
    "image/good.png",
    "image/bad.png",
  ];

  String message;
  String image;
  List<String> dataJawaban;

  @override
  void initState() {
    if (marks < 50) {
      image = images[2];
      message = "Kamu harus mencoba lebih keras..\n" + "Nilaimu $marks";
    } else if (marks < 75) {
      image = images[1];
      message =
          "Kamu bisa melakukannya dengan lebih baik..\n" + "Nilaimu $marks";
    } else {
      image = images[0];
      message = "Kamu melakukannya dengan baik..\n" + "Nilaimu $marks";
    }


    super.initState();
  }

  

  int marks;
  int hitungBenar;
  _ResultPageState(this.marks, this.hitungBenar);

  @override
  Widget build(BuildContext context) {
    int hitungSalah = 10 - hitungBenar;
    int persen = hitungBenar*10;
    double linValue = hitungBenar.toDouble()/10;
    return Scaffold(
        backgroundColor: Color(0xff1E2736),
      appBar: AppBar(
        backgroundColor: Color(0xff1E2736),
        centerTitle: true,
        title: Text(
          "Hasil",
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Material(
                color: Color(0xff1E2736),
                child: Center(
                    child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0,),
                     Padding(
                padding: EdgeInsets.all(15.0),
                child: new LinearPercentIndicator(
                  width: 250.0,
                  animation: true,
                  animationDuration: 3000,
                  lineHeight: 20.0,
                  leading: new Text("Akurasi:", style: TextStyle(color: Colors.white)),
                  percent: linValue,
                  center: Text("$persen%", style: TextStyle(color: Colors.white)),
                  linearStrokeCap: LinearStrokeCap.butt,
                  progressColor: Colors.black,
                ),
              ),
               RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: 'Nilai Kamu ', style: TextStyle(color: Colors.grey)),
                          TextSpan(text: '$marks', style: TextStyle(color: Colors.white))       

                        ]
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                      margin: EdgeInsets.all(5),
                      color: Color(0xff1E2736),
                      height: 40,
                      width: MediaQuery.of(context).size.width / 2 - 100,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.check, color: Colors.green),
                              Text('$hitungBenar',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                          Text('Benar',
                              style: TextStyle(color: Colors.grey, fontSize: 12))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      color: Color(0xff1E2736),
                      height: 40,
                      width: MediaQuery.of(context).size.width / 2 - 100,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.close, color: Colors.red),
                              Text('$hitungSalah',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                          Text('Salah',
                              style: TextStyle(color: Colors.grey, fontSize: 12))
                        ],
                      ),
                    ),
                      ],
                    ),
                   
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                      Divider(),
                      Text('Tinjau Pertanyaan', style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(height: 5.0,),
                      Text('klik Soal untuk melihat penjelasan', style: TextStyle(color: Colors.grey)),
                      ],
                    )
                  ],
                )),
              ),
            ),
            FutureBuilder(
        future:
          DefaultAssetBundle.of(context).loadString('asset/jawaban.json', cache: true),
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
          return ListPembahasan(mydata);
        }
        },
    )
          ],
        ),
      ),
    );
  }
}

class ListPembahasan extends StatefulWidget {
  final List mydata;
  ListPembahasan(this.mydata);
  @override
  _ListPembahasanState createState() => _ListPembahasanState();
}

class _ListPembahasanState extends State<ListPembahasan> {

  double _height = 0;

  showPenjelasan() {
    setState(() {
      _height = _height == 0? 100 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
      itemCount: widget.mydata.length,
      itemBuilder: (context, index) {
        var data = widget.mydata[index];
        return Container(
          padding: EdgeInsets.all(10),
          child: GestureDetector(
            onTap: (){
              showPenjelasan();
            },
            child: Card(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    data['gambar'] == 'noimage'? Center() : Container(
                    color: Colors.white,
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      child: Image.asset(data['gambar']),
                    ),
                  ),
                    Divider(color: Colors.white,),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: "${index+1}. ", style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: "${data['soal']}")
                        ]
                      ),
                    ),
                    Divider(color: Colors.white,),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: "A. ", style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: "${data['a']}")
                        ]
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: "B. ", style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: "${data['b']}")
                        ]
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: "C. ", style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: "${data['c']}")
                        ]
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: "D. ", style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: "${data['d']}")
                        ]
                      ),
                    ),
                    Divider(color: Colors.white,),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(text: "Jawaban: "),
                          TextSpan(text: "${data['jawaban']}", style: TextStyle(fontWeight: FontWeight.bold))
                        ]
                      ),
                    ),
                    Divider(color: Colors.white,),
                    AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height: _height,
                      curve: Curves.ease,
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(text: "Penjelasan: ", style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: "${data['penjelasan']}")
                          ]
                        ),
                      ),
                    ),
                    Divider(color: Colors.white,),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
