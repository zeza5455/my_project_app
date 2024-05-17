import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const homeApp());
}

class homeApp extends StatelessWidget {
  const homeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laundromat_Company',
      home: Homepage_app(),
    );
  }
}

class Homepage_app extends StatefulWidget {
  const Homepage_app({super.key});

  @override
  State<Homepage_app> createState() => _Homepage_appState();
}

class _Homepage_appState extends State<Homepage_app> {
  bool Running01 = false;
  bool Running02 = false;
  String status01 = 'พร้อมให้บริการ';
  String status02 = 'พร้อมให้บริการ';

  void startMachine1() {
    setState(() {
      Running01 = true;
      status01 = 'กำลังซักผ้า';
    });

    Timer(Duration(minutes: 1), () {
      setState(() {
        Running01 = false;
        status01 = 'พร้อมให้บริการ';
        Fluttertoast.showToast(
            msg: 'เครื่องซักผ้า 2 พร้อมให้บริการ',
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            timeInSecForIosWeb: 1,
            fontSize: 16);
      });
    });
  }

  void startMachine2() {
    setState(() {
      Running02 = true;
      status02 = 'กำลังซักผ้า';
    });

    Timer(Duration(minutes: 1), () {
      setState(() {
        Running02 = false;
        status02 = 'พร้อมให้บริการ';
        Fluttertoast.showToast(
            msg: 'เครื่องซักผ้า 2 พร้อมให้บริการ',
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            timeInSecForIosWeb: 1,
            fontSize: 16);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ร้านซักผ้าหยอดเหรียญ'),
        backgroundColor: Color.fromARGB(255, 8, 228, 19),
      ),
      backgroundColor: Color.fromARGB(255, 182, 211, 16),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!Running01)
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              "โปรดหยอดเหรียญเพื่อซักผ้า",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      color: Colors.black87, width: 2),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                ),
                                child: const Text(
                                  "ยกเลิก",
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.black87, width: 2),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text(
                                    "หยอดเหรียญ",
                                  ),
                                  onPressed: () {
                                    startMachine1();
                                    Navigator.pop(context);
                                  }),
                            ],
                          ),
                        );
                      else {
                        Fluttertoast.showToast(
                            msg:
                                'เครื่องนี้กำลังใช้งาน กรุณาเลือกเครื่องถัดไป',
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_LONG,
                            backgroundColor: Colors.green,
                            textColor: Colors.black,
                            timeInSecForIosWeb: 1,
                            fontSize: 16);
                      }
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Card(
                                  child: Container(
                                    height: 215,
                                    width: 150,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 140,
                                          width: 150,
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://i.pinimg.com/236x/9d/78/b0/9d78b087d665500d42d2a6f64399afd5.jpg'), // Replace this with your image asset
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'เครื่อง 1',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        const Text(
                                          'สถานะการใช้งาน',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          status01,
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!Running02)
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              "โปรดหยอดเหรียญเพื่อซักผ้า",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                      color: Colors.black87, width: 2),
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                ),
                                child: Text(
                                  "ยกเลิก",
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.black87, width: 2),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                  ),
                                  child: const Text(
                                    "หยอดเหรียญ",
                                  ),
                                  onPressed: () {
                                    startMachine2();
                                    Navigator.pop(context);
                                  }),
                            ],
                          ),
                        );
                      else
                        Fluttertoast.showToast(
                            msg:
                                'เครื่องนี้กำลังใช้งาน กรุณาเลือกเครื่องถัดไป',
                            gravity: ToastGravity.BOTTOM,
                            toastLength: Toast.LENGTH_LONG,
                            backgroundColor: Colors.green,
                            textColor: Colors.black,
                            timeInSecForIosWeb: 1,
                            fontSize: 16);
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Card(
                                  child: Container(
                                    height: 215,
                                    width: 150,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 140,
                                          width: 150,
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://i.pinimg.com/236x/9d/78/b0/9d78b087d665500d42d2a6f64399afd5.jpg'), // Replace this with your image asset
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const Text(
                                          'เครื่อง 2',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        const Text(
                                          'สถานะการใช้งาน',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          status02,
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}