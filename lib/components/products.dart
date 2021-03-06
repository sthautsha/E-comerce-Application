import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:shoppapp/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  //menumaps creaing
  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Sweater",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 100,
      "price": 80,
    },
    {
      "name": "Black dress",
      "picture": "images/products/dress2.jpeg",
      "old_price": 190,
      "price": 70,
    },
    {
      "name": "Heels",
      "picture": "images/products/hills1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "New Heels",
      "picture": "images/products/hills2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Pants",
      "picture": "images/products/pants1.jpg",
      "old_price": 100,
      "price": 80,
    },
    {
      "name": "Next Pant",
      "picture": "images/products/pants2.jpeg",
      "old_price": 190,
      "price": 70,
    },
    
    {//yy
      "name": "Shoes",
      "picture": "images/products/shoe1.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt1.jpeg",
      "old_price": 100,
      "price": 80,
    },
    {
      "name": "New Skirt",
      "picture": "images/products/skt2.jpeg",
      "old_price": 190,
      "price": 70,
    }

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index){
        return Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
      }  
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: prod_name, 
        child: Material(
          child: InkWell(
            //routing
            onTap: () => Navigator.of(context).push(
               new MaterialPageRoute(
                 builder: (context) => new ProductDetails(
                   //here we are passing the value of the product to the product details page
                   product_detail_name: prod_name,// the value of prod_name is going to be passed to the product deatils name.
                   product_detail_new_price: prod_price,
                   product_detail_old_price: prod_old_price,
                   product_detail_picture: prod_picture,
                 ))),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: new Row (children: <Widget>[
                  Expanded(
                    child: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0,),) ,
                  ),
                  new Text ("\$${prod_price}",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold
                    ),) 
                ],)
                // modification was done 
                // child: ListTile(
                //   leading: Text (
                //     prod_name,
                //      style: TextStyle(fontWeight: FontWeight.bold),
                //      ),
                //      title: Text (
                //        "\$$prod_price",
                //         style: TextStyle(
                //           color: Colors.red,
                //           fontWeight: FontWeight.w800
                //         )
                //       ),
                //       subtitle:  Text (
                //        "\$$prod_old_price",
                //         style: TextStyle(
                //           color: Colors.black54,
                //           fontWeight: FontWeight.w800,
                //           decoration: TextDecoration.lineThrough
                //         ),
                //       ),
                // )
              ),
              child: Image.asset(
                prod_picture,
                fit: BoxFit.cover,
              )),
          ),
        )
      ),
    );
  }
}