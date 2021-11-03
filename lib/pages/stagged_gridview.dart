import 'dart:async';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:responsive_flutter/responsive_flutter.dart';

class StaggeredGridViewExample extends StatefulWidget {
  const StaggeredGridViewExample({ Key key }) : super(key: key);

  @override
  _StaggeredGridViewExampleState createState() => _StaggeredGridViewExampleState();
}

class _StaggeredGridViewExampleState extends State<StaggeredGridViewExample> {
  List<String> images = [
    'assets/waiterssplash/1.jpg',
    'assets/waiterssplash/2.jpg',
    'assets/waiterssplash/3.jpg',
    'assets/waiterssplash/4.jpg',
    'assets/waiterssplash/5.jpg',
    'assets/waiterssplash/6.jpg',
    'assets/waiterssplash/7.jpg',
    'assets/waiterssplash/8.jpg',
    'assets/waiterssplash/9.jpg',
    'assets/waiterssplash/10.jpg',
    'assets/waiterssplash/11.jpg',
    'assets/waiterssplash/12.jpg',
    'assets/waiterssplash/13.jpg',
    'assets/waiterssplash/14.jpg',
    'assets/waiterssplash/15.jpg',
    'assets/waiterssplash/16.jpg',
    'assets/waiterssplash/17.jpg',
    'assets/waiterssplash/18.jpg',
  ];

  ScrollController _scrollController = ScrollController();
  bool _visible=true;
  bool _visible2=false;
  @override
  final Duration initialDelay = Duration(seconds: 1);
  void initState() {
    Future.delayed(Duration(seconds: 0), () {
      _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(seconds: images.length * 10),
          curve: Curves.linear
      );
    });

    super.initState();
    Future.delayed(const Duration(seconds: 5), () { //asynchronous delay
      if (this.mounted) { //checks if widget is still active and not disposed
        setState(() { //tells the widget builder to rebuild again because ui has updated
          _visible=false; //update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            StaggeredGridView.countBuilder(
              padding: EdgeInsets.all(0),
              crossAxisCount: 4,
              controller: _scrollController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
              staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, index.isEven ? 4 : 2),
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
            ),
            Positioned(
              left: 0,
              top: 0,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(1),
                        Colors.black.withOpacity(1),
                      ]
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: AnimatedCrossFade(
                  firstChild: Container(
                    child: Center(
                  child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: ResponsiveFlutter.of(context).hp(5),),
                                    Center(
                                      child: Lottie.asset(
                                        'assets/lottie/lf30_editor_rwlk5vd0.json',
                                        height: ResponsiveFlutter.of(context).hp(30),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,

                                mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      SizedBox(height: ResponsiveFlutter.of(context).hp(25),),
                                      Center(
                                        child: Text("Waiter", style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ResponsiveFlutter.of(context).fontSize(2),
                                            fontWeight: FontWeight.bold
                                        ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                              ],
                            )
                          ]
                  ),
                    )),
                  duration: const Duration(milliseconds: 1000),
                  secondChild: Container(
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: ResponsiveFlutter.of(context).hp(5),),
                          Lottie.asset(
                              'assets/lottie/lf30_editor_rwlk5vd0.json',
                              height: ResponsiveFlutter.of(context).hp(30),
                            ),
                          DelayedDisplay(
                            delay: Duration(seconds: initialDelay.inSeconds + 1),
                              child: TextField(
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                                ),
                                cursorColor: Colors.white70,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0.0),
                                  labelText: 'ایمیل',
                                  hintText: 'نام کاربری یا ایمیل',
                                  labelStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: ResponsiveFlutter.of(context).fontSize(2),
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    // fontSize: 14.0,
                                    fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                  ),
                                  prefixIcon: Icon(
                                    Iconsax.user,
                                    color: Colors.white70,
                                    // size: 18,
                                    size: ResponsiveFlutter.of(context).wp(5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  floatingLabelStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: ResponsiveFlutter.of(context).fontSize(2), //18
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.brown, width: 1.5),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                            )
                          ),
                          SizedBox(height: ResponsiveFlutter.of(context).hp(3),),
                          DelayedDisplay(
                            delay: Duration(seconds: initialDelay.inSeconds + 2),
                            child: TextField(
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: ResponsiveFlutter.of(context).fontSize(2.2),
                              ),
                              cursorColor: Colors.white70,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0.0),
                                labelText: 'رمز عبور',
                                hintText: 'رمز عبور',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: ResponsiveFlutter.of(context).fontSize(1.8),
                                  fontWeight: FontWeight.w400,
                                ),
                                prefixIcon: Icon(
                                  Iconsax.key,
                                  color: Colors.white70,
                                  size: ResponsiveFlutter.of(context).wp(5), ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                floatingLabelStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: ResponsiveFlutter.of(context).fontSize(2),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.brown, width: 1.5),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                          DelayedDisplay(
                            delay: Duration(seconds: initialDelay.inSeconds + 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text('رمز عبور خود را فراموش کردید؟',
                                    style: TextStyle(color: Colors.white38, 
                                        // fontSize: 14.0, 
                                      fontSize: ResponsiveFlutter.of(context).fontSize(2),
                                      fontWeight: FontWeight.w400,
                                    ),),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: ResponsiveFlutter.of(context).hp(5),),
                          DelayedDisplay(
                            delay: Duration(seconds: initialDelay.inSeconds + 4),
                            child: MaterialButton(
                              onPressed: (){},
                              height: ResponsiveFlutter.of(context).hp(5),
                              color: Colors.white24,
                              child: Text("ورود", style: TextStyle(
                                  color: Colors.black,
                                  fontSize:  ResponsiveFlutter.of(context).fontSize(2.2),
                              ),),
                              padding: EdgeInsets.symmetric(
                                  vertical:  ResponsiveFlutter.of(context).hp(1),
                                  horizontal: ResponsiveFlutter.of(context).wp(10)
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(height: ResponsiveFlutter.of(context).hp(5),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DelayedDisplay(
                                delay: Duration(seconds: initialDelay.inSeconds + 5),
                                child: Text('حساب کاربری ندارید؟', style: TextStyle(color: Colors.grey.shade600,
                                    fontSize: ResponsiveFlutter.of(context).fontSize(2),
                                    fontWeight: FontWeight.w400),),
                              ),
                              DelayedDisplay(
                                delay: Duration(seconds: initialDelay.inSeconds + 6),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text('ثبت نام', style: TextStyle(color: Colors.blue,
                                      fontSize: ResponsiveFlutter.of(context).fontSize(2),
                                      fontWeight: FontWeight.w400),),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  firstCurve: Curves.easeOut,
                  secondCurve: Curves.easeIn,
                  sizeCurve: Curves.bounceInOut,
                  crossFadeState: _visible
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,

                ),
              ),
            )
          ],
        )
    );
  }
}