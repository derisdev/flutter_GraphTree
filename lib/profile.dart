import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1E2736),
        elevation: 5.0,
        title: Text(
          'Profil',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
        height: 255,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff1E2736),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              CircularProfileAvatar(
                'https://drive.google.com/uc?id=18EY37rteLKmYLGRWas_Q5g1RT7ogos0L',
                cacheImage: true,
                radius: 70,
                backgroundColor: Color(0xff1E2736),
                borderWidth: 3,
                initialsText: Text(
                  "deris",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                borderColor: Colors.pink,
                elevation: 5.0,
                foregroundColor: Colors.pink.withOpacity(0.5),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Dede Risman', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                SizedBox(
                height: 10.0,
              ),
              Text('1187050019', style: TextStyle(color: Colors.grey, fontSize: 15.0),),
            ],
          ),
        ),
      ),
            Container(
        height: 255,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff003b46),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              CircularProfileAvatar(
                'https://drive.google.com/uc?id=14EaGjQzoEv-4iLm0wqEsl2UZ1cvTR-_w',
                cacheImage: true,
                radius: 70,
                backgroundColor: Color(0xff003b46),
                borderWidth: 3,
                initialsText: Text(
                  "Hannisa",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                borderColor: Colors.purpleAccent,
                elevation: 5.0,
                foregroundColor: Colors.pink.withOpacity(0.5),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Hannisa Fadhila R', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                SizedBox(
                height: 10.0,
              ),
              Text('1187050041', style: TextStyle(color: Colors.grey, fontSize: 15.0),),
            ],
          ),
        ),
      ),
      Container(
        height: 255,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff021C1E),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              CircularProfileAvatar(
                'https://drive.google.com/uc?id=1D_QD1sKJUexaoefj-Hn3rRBtSojjp5wm',
                cacheImage: true,
                radius: 70,
                backgroundColor: Color(0xff021C1E),
                borderWidth: 3,
                initialsText: Text(
                  "fathul",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                borderColor: Colors.cyanAccent,
                elevation: 5.0,
                foregroundColor: Colors.pink.withOpacity(0.5),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Muhammad Fathul Ihsan', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                SizedBox(
                height: 10.0,
              ),
              Text('1187050070', style: TextStyle(color: Colors.grey, fontSize: 15.0),),
            ],
          ),
        ),
      ),
      Container(
        height: 255,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff00293C),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              CircularProfileAvatar(
                'https://drive.google.com/uc?id=16lOXalDZnjaexD2bltJRexSnA0s-pLGz',
                cacheImage: true,
                radius: 70,
                backgroundColor: Color(0xff00293C),
                borderWidth: 3,
                initialsText: Text(
                  "nufal",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                borderColor: Colors.greenAccent,
                elevation: 5.0,
                foregroundColor: Colors.pink.withOpacity(0.5),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Muhammad Naufal R', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                SizedBox(
                height: 10.0,
              ),
              Text('1187050071', style: TextStyle(color: Colors.grey, fontSize: 15.0),),
            ],
          ),
        ),
      ),
      Container(
        height: 255,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff011A27),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              CircularProfileAvatar(
                'https://drive.google.com/uc?id=1ua3TKWG6lhXPEtTDG0DrUzIQAqJZDb5G',
                cacheImage: true,
                radius: 70,
                backgroundColor: Color(0xff011A27),
                borderWidth: 3,
                initialsText: Text(
                  "reza",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                borderColor: Colors.amber,
                elevation: 5.0,
                foregroundColor: Colors.pink.withOpacity(0.5),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text('Reza Fauzan Akbar', style: TextStyle(color: Colors.white, fontSize: 20.0),),
                SizedBox(
                height: 10.0,
              ),
              Text('1187050086', style: TextStyle(color: Colors.grey, fontSize: 15.0),),
            ],
          ),
        ),
      ),
          ],
        ),
      )
    );
  }
}
