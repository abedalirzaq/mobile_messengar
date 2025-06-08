import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messengar/app/modules/Home/Widget/AppBarHome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            AppBarHomeWidget(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(int i = 0;i < 10;i++)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 30,),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 65,
                                          height: 65,
                                          decoration: BoxDecoration(
                                            color: Colors.indigo,
                                            borderRadius: BorderRadius.circular(1000)
                                          ),
                                        ),
                                        Positioned(
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                          width: 13,
                                          height: 13,
                                          decoration: BoxDecoration(
                                            color: Colors.yellow,
                                            borderRadius: BorderRadius.circular(100)
                                          ),
                                        ))
                                      ],
                                    ),
                                    SizedBox(height: 3,),
                                    Text("Ahmad",style: TextStyle(
                                      fontSize: 13,
                                    ),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start, // لضبط النص يسارًا أو يمكن center
                                      children: [
                                        Text(
                                          "test test test test test test test test test test test test test test test test",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
