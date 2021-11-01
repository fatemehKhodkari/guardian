import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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

  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () {
      _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(seconds: images.length * 10),
          curve: Curves.linear
      );
    });

    super.initState();
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
                  color: Colors.black,
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
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Waiter", style: TextStyle(
                        color: Colors.white,
                        fontSize: ResponsiveFlutter.of(context).fontSize(3),
                        fontWeight: FontWeight.bold
                    ),
                    ),
                    SizedBox(height: ResponsiveFlutter.of(context).hp(2),),

                    Image.asset('assets/waiterssplash/icons/waiter.png',
                      color: Colors.white,
                      width: ResponsiveFlutter.of(context).wp(25),
                    ),
                    SizedBox(height: ResponsiveFlutter.of(context).hp(20),),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}