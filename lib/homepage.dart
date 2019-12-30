import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matdis/ilustration.dart';
import 'package:matdis/ilustration2.dart';
import 'package:matdis/pdfview.dart';
import 'package:matdis/quizpage.dart';
import 'package:path_provider/path_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

enum MENU { PRIM, KRUSKAL }

class _HomePageState extends State<HomePage> {
  String _documentPath = 'asset/materi.pdf';

  Future<String> prepareTestPdf() async {
    final ByteData bytes =
        await DefaultAssetBundle.of(context).load(_documentPath);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$_documentPath';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E2736),
        title: Text(
          'Graph and Tree',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 175,
                child: Stack(
                  children: <Widget>[
                    Card(
                      elevation: 10,
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'image/image1.jpeg',
                            height: 110,
                            width: MediaQuery.of(context).size.width,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Materi',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    new Positioned.fill(
                        child: new Material(
                            color: Colors.transparent,
                            child: new InkWell(
                                onTap: () => prepareTestPdf().then((path) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FullPdfViewerScreen(path)),
                                      );
                                    }))))
                  ],
                )),
            Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 175,
                child: Stack(
                  children: <Widget>[
                    Card(
                      elevation: 10,
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'image/image2.jpeg',
                            height: 110,
                            width: MediaQuery.of(context).size.width,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Kuis',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    new Positioned.fill(
                        child: new Material(
                            color: Colors.transparent,
                            child: new InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GetJson())))))
                  ],
                )),
            Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: 175,
                child: Stack(
                  children: <Widget>[
                    Card(
                      elevation: 10,
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'image/image3.jpeg',
                            height: 110,
                            width: MediaQuery.of(context).size.width,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Ilustrasi',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    new Positioned.fill(
                        child: new Material(
                            color: Colors.transparent,
                            child: new InkWell(onTap: () => confirm(context))))
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Future<Null> confirm(BuildContext context) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
              SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context, MENU.PRIM);
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.bubble_chart,
                      color: Colors.pink,
                    ),
                    title: Text('Algoritma Prim', textAlign: TextAlign.center),
                  )),
              Divider(
                color: Colors.grey,
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, MENU.KRUSKAL);
                },
                child: ListTile(
                    leading: Icon(Icons.pie_chart, color: Colors.pink),
                    title: Text(
                      'Algoritma Kruskal',
                    )),
              )
            ],
          );
        })) {
      case MENU.PRIM:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Prim()));
        break;
      case MENU.KRUSKAL:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Kruskal()));
        break;
    }
  }
}
