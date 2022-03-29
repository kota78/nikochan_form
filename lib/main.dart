import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

var searchWord = "";
double width = 110;
bool eye = true;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  Widget field(String label){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        child: TextField(
          style: TextStyle(
            fontSize: 40
          ),
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: label
          ),
          // 変更を即時反映する。
          onChanged: (value) {
            if (value.length > 0) {
              // 入力値があるなら、それを反映する。
              setState(() {
                eye = true;
                searchWord = value;
                if (value.length < 16) {
                  width = 110 + 50 / 16 * value.length;
                }
                else {width = 160;}
              });
            }
            else {
              setState(() {
                eye = true;
                searchWord = "";
                width = 110;
              });
            }
          },
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(child: Align(alignment: Alignment.topCenter, child: Image.asset('assets/nikochan.jpg',))),
        Column(
          children: [
            SizedBox(height: 190,),
            (() {
              if (eye == true) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: width),
                    Icon((Icons.circle)),
                    SizedBox(width: 60,),
                    Icon((Icons.circle)),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 135),
                    Icon((Icons.clear),),
                    SizedBox(width: 60,),
                    Icon((Icons.clear),),
                  ],
                );
              }
            })(),
            Expanded(child: Container()),
            field("ID"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                child: TextField(
                  style: TextStyle(
                      fontSize: 40
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "password"
                  ),
                  // 変更を即時反映する。
                  onChanged: (value) {
                    eye = false;
                    setState(() {});
                  },
                ),
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
        //Positioned.fill(child: Container(color: Colors.black.withOpacity(0.2),),),
      ],),
    );
  }
}
