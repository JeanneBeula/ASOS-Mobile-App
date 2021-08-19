import 'package:asos_mobile_app/screen/login.dart';
import 'package:asos_mobile_app/screen/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JoinApp extends StatefulWidget {
  @override
  _JoinAppState createState() => _JoinAppState();
}

class _JoinAppState extends State<JoinApp> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 2);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (_context) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 217,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: 85,
                      child: Image.asset("assets/images/bg1.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 49),
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Color(0xff7879f1),
                  labelColor: Color(0xff7879f1),
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w800,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w800,
                  ),
                  tabs: <Widget>[
                    Tab(
                      text: "Login",
                    ),
                    Tab(
                      text: "Register",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Container(
                height: 600,
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    LoginView(),
                    RegisterView(),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
