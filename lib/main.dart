import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Task 4',
      theme: ThemeData(),
      home: ShoppingCart(),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  static const routeName = "ShoppingCart";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ShoppingCart> {

  List items = [];

  Function addItem(){
    setState(() {
      items.add("item");
    });
  }

  Function removeItem(){
    setState(() {
      items.removeLast();
    });
  }

  Widget CartIcon(){
    return Center(
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Icon(
            Icons.shopping_cart,
            color: Colors.blue,
            size: 35,
          ),

          items.length > 0
              ? Positioned(
            right: -5,
            top: -5,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.pinkAccent,
                  radius: 10,
                ),
                Text(
                  "${items.length}",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          )
              : Text("")
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(
        title: Text("Shoping Cart", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[

          CartIcon(),

          SizedBox(width: 15,)
        ],
      ),

      body: HomePageBody(items, addItem, removeItem),
    );
  }
}






class HomePageBody extends StatefulWidget {
  List items = [];
  Function addItem;
  Function removeItem;
  HomePageBody(this.items, this.addItem , this.removeItem);
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          widget.items.length > 0
              ? RichText(
            text: TextSpan(
              text: 'You have ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25
              ),
              children: <TextSpan>[
                TextSpan(
                    text: '${widget.items.length}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red
                    )
                ),
                TextSpan(text: ' at your cart'),
              ],
            ),
          )
              : Text(
            "Your cart is empty...",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 40),
            width: 300,
            child: RaisedButton(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                  ),
                ),
              ),
              color: Colors.blueAccent,
              onPressed: widget.addItem
              ,
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 40),
            width: 300,
            child: RaisedButton(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Removed From Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                  ),
                ),
              ),
              color: Colors.blueAccent,
              onPressed: (){
                widget.removeItem();
              },
            ),
          ),

        ],
      ),
    );
  }
}

