import 'dart:convert';
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class results extends StatefulWidget {
  @override
  _resultsState createState() => _resultsState();
}

class _resultsState extends State<results> {

  List resultData = [];
  String elpased = '';
  bool second = false;
  bool error = false;
  bool none = false;

  getResults(String title, String author, String year, String language, String extension) async {
    Response response = await get('https://infinite-reads-api.herokuapp.com/$title,$author,$year,$language,$extension', headers: {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    },
    );

    print('https://infinite-reads-api.herokuapp.com/$title/$author/$year/$language/$extension');
    setState(() {
      resultData = jsonDecode(response.body);
      if (resultData.length == 0) {
        none = true;
      }
    });

  }

  _launchURL(url) async {
    await canLaunch(url) ? await launch(url) : error = true;
  }

  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    if (second == false) {
      final stopwatch = Stopwatch()..start();
      getResults(data['title'], data['author'], data['year'], data['language'], data['extension']);
      elpased = stopwatch.elapsed.inMicroseconds.toString();
      setState(() {
        second = true;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('${resultData.length} results in $elpased microseconds', style: TextStyle(fontSize: 15),),
      ),
      body: none ? Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        child: Container(
          height: 300,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Oops, no results!',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20,),
              Text('please check your input \ndata!', style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      elevation: 10,
                      shadowColor: Colors.black,
                      shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                  ),
                  onPressed: () => Navigator.pushReplacementNamed(context, 'search'),
                  child: Text('Back'))
            ],
          ),
        ),
      ) : ListView.builder(
        itemCount: resultData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Card(
              color: Colors.white38,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              elevation: 25,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      resultData[index]['Title'],
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow[800]
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text(
                          resultData[index]['Author'],
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueGrey
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          resultData[index]['Year'],
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          resultData[index]['Size'],
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey
                          ),
                        ),
                        SizedBox(width: 20,),
                        Text(
                          resultData[index]['Extension'],
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blueGrey
                          ),
                        ),
                        SizedBox(width: 20,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _launchURL(launch(resultData[index]['Mirror_1']).toString());
                          },
                          child: Text('Mirror 1'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.yellow[800],
                            elevation: 10,
                            shadowColor: Colors.black,
                            shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                          ),
                        ),
                        SizedBox(width: 20,),
                        ElevatedButton(
                          onPressed: () {
                            _launchURL(launch(resultData[index]['Mirror_2']).toString());
                          },
                          child: Text('Mirror 2'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.yellow[800],
                              elevation: 10,
                              shadowColor: Colors.black,
                              shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                          ),
                        ),
                        SizedBox(width: 20,),
                        ElevatedButton(
                          onPressed: () {
                            _launchURL(launch(resultData[index]['Mirror_3']).toString());
                          },
                          child: Text('Mirror 3'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.yellow[800],
                              elevation: 10,
                              shadowColor: Colors.black,
                              shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                          ),
                        ),
                        SizedBox(width: 20,),
                        ElevatedButton(
                          onPressed: () {
                            _launchURL(launch(resultData[index]['Mirror_4']).toString());
                          },
                          child: Text('Mirror 4'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.yellow[800],
                              elevation: 10,
                              shadowColor: Colors.black,
                              shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                          ),
                        ),
                        SizedBox(width: 20,),
                        ElevatedButton(
                          onPressed: () {
                            _launchURL(launch(resultData[index]['Mirror_5']).toString());
                          },
                          child: Text('Mirror 5'),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.yellow[800],
                              elevation: 10,
                              shadowColor: Colors.black,
                              shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ),
          );
        },
      ),
    );
  }
}

