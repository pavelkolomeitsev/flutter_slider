import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Slider Demo'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current = 0;

  List<String> imgList = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
    'assets/image6.jpg',
    'assets/image7.jpg',
  ];

  List<T> map<T>(List list, Function foo ){
    List<T> result = [];
    for(int i = 0; i < list.length; i++){
      result.add(foo(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new CarouselSlider(
              height: MediaQuery.of(context).size.height / 2,
              initialPage: 0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (index) => setState(() {
                    _current = index;
                  }),
              items: imgList.map((index) {
                return new Builder(builder: (BuildContext context) {
                  return new Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.asset(
                      index,
                      fit: BoxFit.fill,
                    ),
                  );
                });
              }).toList(),
            ),
            new SizedBox(
              height: 15.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url){
                return new Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.blue : Colors.black12,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
