import 'package:asos_mobile_app/screen/productScreen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        shadowColor: Color(0xff7879f1),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 5, 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: ((BuildContext context, int index) {
                            return Container(
                                alignment: Alignment.topCenter,
                                margin: EdgeInsets.all(2),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xff7879f1),
                                            blurRadius:
                                                1.0, // soften the shadow
                                            spreadRadius:
                                                1.0, //extend the shadow
                                            offset: Offset(
                                              1.0, // Move to right 10  horizontally
                                              1.0, // Move to bottom 10 Vertically
                                            ),
                                          )
                                        ],
                                      ),
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => StyleView(),
                                            ),
                                          );
                                        },
                                        child: Text("Cat1"),
                                      ),
                                    ),
                                  ],
                                ));
                          })),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: (itemWidth / itemHeight),
                          crossAxisCount: 2,
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: 1.0,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, int index) {
                          return Container(
                              margin: EdgeInsets.all(5),
                              child: Container(
                                height: 180,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xff7879f1),
                                      blurRadius: 1.0, // soften the shadow
                                      spreadRadius: 1.0, //extend the shadow
                                      offset: Offset(
                                        1.0, // Move to right 10  horizontally
                                        1.0, // Move to bottom 10 Vertically
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
