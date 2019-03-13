import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'model/product.dart';
import 'model/product_repository.dart';
import 'supplemental/asymmetric_view.dart';



class SecondRoute extends StatefulWidget {
  final Category category;

const SecondRoute({this.category:Category.all});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreen();
  }

  }



List<Card> _allCards(int count){
    List<Card> cards=List.generate(count, (int index)=>Card(
      clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AspectRatio(aspectRatio: 18 / 11,
          child: Image.asset("packages/shrine_images/8-0.jpg"),
        ),
      Padding(padding: EdgeInsets.fromLTRB(12, 10, 12, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Succes"),
          SizedBox(height: 10,),
          Text("Is your destiny")
        ],
      ),
      )
      ],
    ),
    ));
    return cards;
}
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

   // final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((myproduct) {
      return Card(

        clipBehavior: Clip.antiAlias,
        // TODO: Adjust card heights (103)
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(
                myproduct.assetName,
                package: myproduct.assetPackage,
             //   fit: BoxFit.fill,
                // TODO: Adjust the box size (102)
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  // TODO: Align labels to the bottom and center (103)
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                    // TODO: Handle overflowing labels (103)
                    Text(
                      myproduct.name,
                     // style: theme.textTheme.title,

                      maxLines: 1,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      formatter.format(myproduct.price),
                  //    style: theme.textTheme.body2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
//class HomeScreen extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _HomeScreen();
//  }
//
//}
class _HomeScreen extends State<SecondRoute>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
//      appBar: AppBar(
//        title: Text("Second Route"),
//        leading: IconButton(
//            icon: Icon(
//              Icons.menu,
//              semanticLabel: "menu",
//            ),
//            onPressed: () {
//              print("button clicked");
//            }),
//        actions: <Widget>[
//          IconButton(
//              icon: Icon(
//                Icons.search,
//                semanticLabel: "search",
//              ),
//              onPressed: () {
//                print("search button clicked");
//              }),
//          IconButton(
//              icon: Icon(
//                Icons.tune,
//                semanticLabel: "filter",
//              ),
//              onPressed: () {
//                print("filter button clicked");
//              })
//        ],
//      ),

      body: AsymmetricView(products: ProductsRepository.loadProducts(widget.category)),

    );
  }

}

//home: Backdrop(
//// TODO: Make currentCategory field take _currentCategory (104)
//currentCategory: Category.all,
//// TODO: Pass _currentCategory for frontLayer (104)
//frontLayer: HomePage(),
//// TODO: Change backLayer field value to CategoryMenuPage (104)
//backLayer: Container(color: kShrinePink100),
//frontTitle: Text('SHRINE'),
//backTitle: Text('MENU'),
//)
