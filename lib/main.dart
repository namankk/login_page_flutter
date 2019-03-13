import 'package:flutter/material.dart';
import 'package:login_page_flutter/category_menu_page.dart';
import 'colors.dart';
import 'model/product.dart';
import 'backdrop.dart';
import 'home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _buildShrineTheme(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
  ThemeData _buildShrineTheme(){
    ThemeData mybase=ThemeData.light();
    return mybase.copyWith(
      accentColor: kShrineBrown900,
      primaryColor: kShrinePink100,
      buttonTheme: mybase.buttonTheme.copyWith(
        buttonColor: kShrinePink100,
        textTheme: ButtonTextTheme.normal,
      ),
     // scaffoldBackgroundColor: kShrineBackgroundWhite,
     // cardColor: kShrineBrown900,
      textSelectionColor: kShrinePink100,
      errorColor: kShrineErrorRed,
      textTheme: _buildShrineTextTheme(mybase.textTheme),
      primaryTextTheme: _buildShrineTextTheme(mybase.primaryTextTheme),
      accentTextTheme: _buildShrineTextTheme(mybase.accentTextTheme),
      primaryIconTheme: mybase.iconTheme.copyWith(
          color: kShrineBrown900
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      // TODO: Add the text themes (103)
      // TODO: Add the icon themes (103)
      // TODO: Decorate the inputs (103)
    );
  }
  TextTheme _buildShrineTextTheme(TextTheme base) {
    return base.copyWith(
      headline: base.headline.copyWith(
        fontWeight: FontWeight.w500,
      ),
      title: base.title.copyWith(
          fontSize: 18.0,


    ),

      caption: base.caption.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 15.0,
      ),
    ).apply(
      //fontFamily: 'Rubik',
      displayColor: kShrineBrown900,
      bodyColor: kShrineBrown900,
     decorationStyle: TextDecorationStyle.solid
     // decorationColor: kShrineErrorRed
    );

  }
}
class AccentColorOverride extends StatelessWidget {
  const AccentColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(
        accentColor: color,
        primaryColorBrightness: Brightness.light,
        brightness: Brightness.dark,
      ),
    );
  }
}
//class SecondRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Second Route"),
//      ),
//      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            // Navigate back to first route when tapped.
//            Navigator.pop(context);
//          },
//          child: Text('Go back!'),
//        ),
//      ),
//    );
//  }
//}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String newTextData;
//
  Category _currentCategory = Category.all;
//
//  void _onCategoryTap(Category category) {
//    setState(() {
//      _currentCategory = category;
////      Navigator.push(context, MaterialPageRoute(builder: (context)=>Backdrop(
////        // TODO: Make currentCategory field take _currentCategory (104)
////        currentCategory: _currentCategory,
////        // TODO: Pass _currentCategory for frontLayer (104)
////        frontLayer: SecondRoute(category: _currentCategory,),
////        // TODO: Change backLayer field value to CategoryMenuPage (104)
////        backLayer: CategoryMenuPage(
////          currentCategory: _currentCategory,
////          onCategoryTap: _onCategoryTap,
////        ),
////        frontTitle: Text('SHRINE'),
////        backTitle: Text('MENU'),
////      ),
////      )
////      );
//    });
//  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
     this._counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
//      appBar: AppBar(
//        // Here we take the value from the MyHomePage object that was created by
//        // the App.build method, and use it to set our appbar title.
//        title: Text(widget.title),
//
//      ),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: <Widget>[
          SizedBox(height: 80),
          Column(
            children: <Widget>[
              Image.asset('images/diamond.png'),
              SizedBox(height: 16.0),
              Text('SHRINE'),
            ],
          ),
          SizedBox(height: 120.0),
       AccentColorOverride(color: kShrineBrown900,child:  TextField(
         controller: _passwordController,
         decoration: InputDecoration( labelText: "Username"),
       ),),
          SizedBox(
            height: 12.0,
          ),
         AccentColorOverride(color: kShrineBrown900,child:  TextField(
           controller: _passwordController,
           decoration: InputDecoration( labelText: "Password"),
           obscureText: true,
         ),
         ),
          ButtonBar(
            // TODO: Add a beveled rectangular border to CANCEL (103)
            children: <Widget>[
              // TODO: Add buttons (101)
              FlatButton(
                child: Text('CANCEL'),
                onPressed: () {
              // TODO: Clear the text fields (101)
                  _usernameController.clear();
                  _passwordController.clear();
                },
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7.0))),
              ),
              // TODO: Add an elevation to NEXT (103)
              // TODO: Add a beveled rectangular border to NEXT (103)
              Center(
                child: RaisedButton(
                  child: Text('NEXT'),
                  onPressed: () {
                    newTextData=_usernameController.text;
                    // TODO: Show the next page (101)
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Backdrop(
                      // TODO: Make currentCategory field take _currentCategory (104)
                      currentCategory: _currentCategory,
                      // TODO: Pass _currentCategory for frontLayer (104)
//                      frontLayer: SecondRoute(category: _currentCategory,),
//                      // TODO: Change backLayer field value to CategoryMenuPage (104)
//                      backLayer: CategoryMenuPage(
//                        currentCategory: _currentCategory,
//                        onCategoryTap: _onCategoryTap,
//                      ),
                      frontTitle: Text('SHRINE'),
                      backTitle: Text('MENU'),
                    ),
                    )
                    );
                  },
                  shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7.0))),
                  elevation: 8.0,
                ),
              ),
            ],
          ),
        ],
      )),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
