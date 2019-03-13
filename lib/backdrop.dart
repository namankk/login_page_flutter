import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'colors.dart';
import 'model/product.dart';
import 'home.dart';
import 'category_menu_page.dart';
const double _kFlingVelocity = 2.0;

// TODO: Add velocity constant (104)

class Backdrop extends StatefulWidget {
  final Category currentCategory;
//  final Widget frontLayer;
  //final Widget backLayer;
  final Widget frontTitle;
  final Widget backTitle;

  const Backdrop({
    @required this.currentCategory,
  //  @required this.frontLayer,
    //@required this.backLayer,
    @required this.frontTitle,
    @required this.backTitle,
  })  : //assert(currentCategory != null),
      //  assert(frontLayer != null),
        //assert(backLayer != null),
        assert(frontTitle != null),
        assert(backTitle != null);

  @override
  _BackdropState createState() => _BackdropState();
}

// TODO: Add _FrontLayer class (104)
// TODO: Add _BackdropTitle class (104)
// TODO: Add _BackdropState class (104)

class _BackdropState extends State<Backdrop>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
  AnimationController _controller;

  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
//      Navigator.push(context, MaterialPageRoute(builder: (context)=>Backdrop(
//        // TODO: Make currentCategory field take _currentCategory (104)
//        currentCategory: _currentCategory,
//        // TODO: Pass _currentCategory for frontLayer (104)
//        frontLayer: SecondRoute(category: _currentCategory,),
//        // TODO: Change backLayer field value to CategoryMenuPage (104)
//        backLayer: CategoryMenuPage(
//          currentCategory: _currentCategory,
//          onCategoryTap: _onCategoryTap,
//        ),
//        frontTitle: Text('SHRINE'),
//        backTitle: Text('MENU'),
//      ),
//      )
//      );
    });
  }
  @override
  void didUpdateWidget(Backdrop old) {
    super.didUpdateWidget(old);

    if (_currentCategory != old.currentCategory) {
      _toggleBackdropLayerVisibility();
    } else if (!_frontLayerVisible) {
      _controller.fling(velocity: _kFlingVelocity);
    }
  }
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, value: 1.0, duration: Duration(milliseconds: 300));
  }

  // todo chnage visibilty
  bool get _frontLayerVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleBackdropLayerVisibility() {
    _controller.fling(
        velocity: _frontLayerVisible ? -_kFlingVelocity : _kFlingVelocity);
  }

  //todo endi of animation
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  } // TODO: Add AnimationController widget (104)

  // TODO: Add BuildContext and BoxConstraints parameters to _buildStack (104)
  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double layerTitleHeight = 48.0;
    final Size layerSize = constraints.biggest;
    final double layerTop = layerSize.height - layerTitleHeight;

    // TODO: Create a RelativeRectTween Animation (104)
    Animation<RelativeRect> layerAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(
          0.0, layerTop, 0.0, layerTop - layerSize.height),
      end: RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
    ).animate(_controller.view);

    return Stack(
      key: _backdropKey,
      children: <Widget>[
        ExcludeSemantics(
          child: CategoryMenuPage(
            currentCategory: _currentCategory,
            onCategoryTap: _onCategoryTap,
          ),
          excluding: _frontLayerVisible,
        ),
        PositionedTransition(
          rect: layerAnimation,
          child: _FrontLayer(
            child: SecondRoute(category: _currentCategory,),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      brightness: Brightness.light,
      elevation: 0.0,
      titleSpacing: 0.0,
      // TODO: Replace leading menu icon with IconButton (104)
      // TODO: Remove leading property (104)
      // TODO: Create title with _BackdropTitle parameter (104)
      leading: IconButton(onPressed: _toggleBackdropLayerVisibility, icon:Icon( Icons.menu),
      ),
      title: Text('SHRINE'),
      actions: <Widget>[
        // TODO: Add shortcut to login screen from trailing icons (104)
        IconButton(
          icon: Icon(
            Icons.search,
            semanticLabel: 'search',
          ),
          onPressed: () {
            // TODO: Add open login (104)
          },
        ),
        IconButton(
          icon: Icon(
            Icons.tune,
            semanticLabel: 'filter',
          ),
          onPressed: () {
            // TODO: Add open login (104)
          },
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      // TODO: Return a LayoutBuilder widget (104)
      body: LayoutBuilder(builder: _buildStack),
    );
  }
}

class _FrontLayer extends StatelessWidget {
  // TODO: Add on-tap callback (104)
  const _FrontLayer({
    Key key,
    this.onTap, // New code

    this.child,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTap; // New code


  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 16.0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(46.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: Container(
              height: 40.0,
              alignment: AlignmentDirectional.centerStart,
            ),
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
