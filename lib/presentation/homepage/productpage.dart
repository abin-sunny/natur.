import 'package:flutter/material.dart';
import 'package:newecommerce/constants.dart';
import 'package:newecommerce/presentation/mwidgets.dart';
import '../mwidgets.dart';
import 'widgsets.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
       
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: appbarr(
              '',
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.favorite_outline,
                    color: Colors.red,
                    size: 30,
                  ),
                )
              ]),
          body: Column(
            children: [
              spacer(context, 350),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  padding: EdgeInsets.all(25),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Osmind Armchair',
                          style: TextStyle(color: presscolor, fontSize: 18),
                        ),
                        Text(
                          '\$230',
                          style: TextStyle(color: presscolor, fontSize: 18),
                        ),
                      ],
                    ),
                    Container(
                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2,color:presscolor)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         Row(
                            children: [Column(children: [
                              spacer(context, 15),
                              Image.asset('assets/icons/move.png'), Text('24X19X18',style: TextStyle(color:presscolor,fontSize: 10),),
                        spacer(context, 15)    ])],
                          ),////////////////
                          Row(
                            children: [Column(children: [spacer(context, 15),
                             Image.asset('assets/icons/archive.png'), Text('24X19X18',style: TextStyle(color:presscolor,fontSize: 10),),
                           spacer(context, 15) ])],
                          ),
                          //
                          Row(
                            children: [Column(children: [spacer(context, 15),
                           Image.asset('assets/icons/flag.png'), Text('24X19X18',style: TextStyle(color:presscolor,fontSize: 10),),
                           spacer(context, 15) ])],
                          ),
                          //
                          Row(
                            children: [Column(children: [spacer(context, 15),
                            Image.asset('assets/icons/award.png'), Text('24X19X18',style: TextStyle(color:presscolor,fontSize: 10),),
                            spacer(context, 15)
                            ])],
                          ),
                        ],
                      ),
                    ),
                    spacer(context, 13),
                    Text(
                      'Light weight Osmind Armchair is famous for it’s comfort and durability, it’s made of unproductive oil palm wood from Indonesia. Water resistant and weather shield formula is applied for longer life.',
                      style: TextStyle(
                        color: presscolor,
                        fontSize: 12,
                      ),
                    ),
                    spacer(context, 50),
                    cart(Text('Add to cart'), 22, (){
                      showSnack(context, Text('Added to cart'), 2);
                    }),
                  ]),
                ),
              )
            ],
          )),
    );
  }
}
