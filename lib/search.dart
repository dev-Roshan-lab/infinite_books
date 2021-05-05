import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:url_launcher/url_launcher.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {

  String title = '';
  String author = '';
  String year = '';
  String language = '';
  String extension;
  final myController = TextEditingController();
  final authctrl = TextEditingController();
  final yearctrl = TextEditingController();
  final langctrl = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  _launchURL(url) async {
    await canLaunch(url) ? await launch(url) : print('error');
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'infinity',
              child: Material(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('B', style: TextStyle(color: Colors.black, fontSize: 80),),
                    Text('\u221E', style: TextStyle(color: Colors.yellow[800], fontSize: 80),),
                    Text('ks', style: TextStyle(color: Colors.black, fontSize: 80))
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10)
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(
                        suffixIcon: Transform.rotate(
                          angle:3.92,
                          child: IconButton(
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              myController.clear();
                            },
                          ),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Enter title of the book',
                        labelStyle: TextStyle(
                            color: Colors.yellow[800]
                        ),
                        fillColor: Colors.yellow[800],
                        focusedBorder:OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      onSubmitted: (tag) {
                        print('--------------tag');
                        print(tag);
                        if (tag != '') {
                          setState(() {
                            title = tag;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: authctrl,
                          decoration: InputDecoration(
                            suffixIcon: Transform.rotate(
                              angle:3.92,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  authctrl.clear();
                                },
                              ),
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Enter Author of the book',
                            labelStyle: TextStyle(
                                color: Colors.yellow[800]
                            ),
                            fillColor: Colors.yellow[800],
                            focusedBorder:OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          onSubmitted: (tag) {
                            print('--------------tag');
                            print(tag);
                            setState(() {
                              author = tag;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 20,),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: yearctrl,
                          decoration: InputDecoration(
                            suffixIcon: Transform.rotate(
                              angle:3.92,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  yearctrl.clear();
                                },
                              ),
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Enter year of publication',
                            labelStyle: TextStyle(
                                color: Colors.yellow[800]
                            ),
                            fillColor: Colors.yellow[800],
                            focusedBorder:OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          onSubmitted: (tag) {
                            print('--------------tag');
                            print(tag);
                            setState(() {
                              year = tag;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: langctrl,
                          decoration: InputDecoration(
                            suffixIcon: Transform.rotate(
                              angle:3.92,
                              child: IconButton(
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  langctrl.clear();
                                },
                              ),
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'Enter language of the book',
                            labelStyle: TextStyle(
                                color: Colors.yellow[800]
                            ),
                            fillColor: Colors.yellow[800],
                            focusedBorder:OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          onSubmitted: (tag) {
                            setState(() {
                              language = tag;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 20,),
                      SizedBox(
                        width: 300,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2.0
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: DropdownButton<String>(
                              hint: Text('Extension of the file', style: TextStyle(
                                  color: Colors.yellow[800]
                              )),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.yellow[800],
                              ),
                              value: extension,
                              underline: SizedBox(),
                              onChanged: (String newValue) {
                                setState(() {
                                  extension = newValue;
                                });
                              },
                              items: <String>['epub', 'pdf', 'mobi']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            RaisedButton(
              onPressed: () {
                if (myController.text == '') {
                  Fluttertoast.showToast(
                      msg: "Enter title to search",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                  );
                } else {
                  Navigator.pushNamed(context, 'results', arguments: {
                    'title' : title,
                    'author' : author,
                    'year' : year,
                    'language' : language,
                    'extension' : extension == null ? '' : extension,
                  });
                }
              },
              color: Colors.amber,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text("Search", style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
            )
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset('assets/github.png'),
            ),
            onPressed: () {
              _launchURL('https://github.com/dev-Roshan-lab');
            },
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset('assets/bmc.png'),
            ),
            onPressed: () {
              _launchURL('https://www.buymeacoffee.com/devroshan');
            },
          ),
        ],
      ),

    );
  }
}
