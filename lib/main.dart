import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

//my own imports
import 'package:shoppapp/components/horizontal_listview.dart';
import 'package:shoppapp/components/products.dart';
import 'package:shoppapp/pages/cart.dart';


void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    )
  );
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  Widget image_carousel =new Container(
    height: 160.0, 
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/c1.jpg'),
        AssetImage('images/m1.jpeg'),
        AssetImage('images/w3.jpeg'),
        AssetImage('images/w4.jpeg'),
        AssetImage('images/m2.jpg'),
      ],
      autoplay: false,
      // animationCurve: Curves.fastOutSlowIn,
      // animationDuration: Duration(milliseconds: 1000),
      dotSize: 4.0,
      //dotCosslor: Colors.red,
      indicatorBgPadding: 4.0,
      dotBgColor: Colors.transparent,
    ),
  );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text('FashApp'),
        actions:<Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
          new IconButton(
            icon: Icon(
              Icons.shopping_cart, 
              color: Colors.white,), 
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
              })
        ],
      ),
    drawer: new Drawer(
      child: new ListView(
        children: <Widget>[
          // header
          new UserAccountsDrawerHeader(
            accountName: Text('Utsha Shrestha'), 
            accountEmail: Text('utshashrestha07@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color:Colors.white,),
              )
            ),
            decoration: new BoxDecoration(
              color: Colors.red
            ),
          ),
          // body
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Home Page'),
              leading: Icon(Icons.home, color: Colors.red),
              )
          ),
          
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Account'),
              leading: Icon(Icons.person, color: Colors.red),
              )
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('My Orders'),
              leading: Icon(Icons.shopping_basket, color: Colors.red),
              )
          ),

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>new Cart()));
            },
            child: ListTile(
              title: Text('Shopping cart'),
              leading: Icon(Icons.shopping_cart, color: Colors.red),
              )
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Favourites'),
              leading: Icon(Icons.favorite, color: Colors.red ),
              )
          ),
          

          Divider(),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings, ),
              )
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text('About'),
              leading: Icon(Icons.help,),
              )
          ),
        ],

      ),
    ),
    body: new ListView(
      children: <Widget>[
        //image_carousel begin here
        image_carousel,
        //padding widget
        new Padding(padding: const EdgeInsets.all(8.0),
        child: new Text('Categories'),),

        //Horizontal List view begins here
        HorizontalList(),

        //padding widget
        new Padding(padding: const EdgeInsets.all(20.0),
        child: new Text('Recent Products'),),

        //grid view
        Container(
          height: 320.0,
          child: Products(),
        )

      ],
    ), 
    );
  }
}