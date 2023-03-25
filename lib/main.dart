import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            title: Text(
              'Daily',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontSize: 18,
              )),
            ),
          ),
          body: Container(
            alignment: AlignmentDirectional.topCenter,
            color: const Color.fromARGB(245, 245, 245, 255),
            child: Column(
              children: [
                SizedBox(
                  height: 49,
                ),
                Container(
                  width: 330,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Daily feito em 04 de Janeiro 2023        ',
                        style: GoogleFonts.notoSans(
                            textStyle: TextStyle(
                          color: Color.fromARGB(74, 111, 114, 255),
                        )),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(54, 34)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'abrir',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 330,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Daily feito em 04 de Janeiro 2023        ',
                        style: GoogleFonts.notoSans(
                            textStyle: TextStyle(
                          color: Color.fromARGB(74, 111, 114, 255),
                        )),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(54, 34)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'abrir',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 330,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Daily feito em 04 de Janeiro 2023        ',
                        style: GoogleFonts.notoSans(
                            textStyle: TextStyle(
                          color: Color.fromARGB(74, 111, 114, 255),
                        )),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(54, 34)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'abrir',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 330,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Daily feito em 04 de Janeiro 2023        ',
                        style: GoogleFonts.notoSans(
                            textStyle: TextStyle(
                          color: Color.fromARGB(74, 111, 114, 255),
                        )),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(54, 34)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'abrir',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 330,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Daily feito em 04 de Janeiro 2023        ',
                        style: GoogleFonts.notoSans(
                            textStyle: TextStyle(
                          color: Color.fromARGB(74, 111, 114, 255),
                        )),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(Size(54, 34)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'abrir',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
