import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: Builder(
        builder: (BuildContext context) {
          return MyOnboarding();
        },
      ),
    );
  }
}

class MyOnboarding extends StatefulWidget {
  MyOnboarding({Key key}) : super(key: key);

  @override
  _MyOnboardingState createState() => _MyOnboardingState();
}

class _MyOnboardingState extends State<MyOnboarding> {
  final int _numPage = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildIndicators() {
    List<Widget> listIndicators = [];
    for (int i = 0; i < _numPage; i++) {
      listIndicators.add(
        i == _currentPage ? _indicator(true) : _indicator(false),
      );
    }
    return listIndicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.all(8.0),
      width: isActive ? 10.0 : 16.0,
      height: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: isActive ? Colors.amber : Colors.grey[400],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xfff7f8f9),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Onboarding',
          style: TextStyle(
            color: Colors.grey[800],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff3594dd),
                  Color(0xff4563db),
                  Color(0xff5036d5),
                  Color(0xff5b16d0),
                ]),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        print('Skip');
                      });
                    },
                    child: Text('Skip'),
                  ),
                ),
                Container(
                  // color: Colors.red,
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Center(
                              child: Image(
                                width: 300,
                                height: 300,
                                image: AssetImage('img/sleep.png'),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Hi there!',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Center(
                              child: Image(
                                width: 300,
                                height: 300,
                                image: AssetImage('img/monitor_sleep.png'),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Hi there!',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Center(
                              child: Image(
                                width: 300,
                                height: 300,
                                image: AssetImage('img/sleeper.png'),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              'Hi there!',
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicators(),
                ),
                _currentPage != _numPage - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                _pageController.nextPage(
                                    duration: Duration(microseconds: 500),
                                    curve: Curves.easeInOut);
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25.0),
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
