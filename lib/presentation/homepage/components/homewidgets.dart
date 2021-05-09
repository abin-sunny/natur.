import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newecommerce/presentation/homepage/productpage.dart';

import '../../../constants.dart';
import '../../mwidgets.dart';

class TabPageView extends StatelessWidget {
  const TabPageView({this.cat});
  final cat;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('collection')
              .where('cat', isEqualTo: cat)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.data == null)
              return Container(child: CircularProgressIndicator());
            return PageView.builder(
              controller: PageController(
                viewportFraction: 0.65,
                initialPage: 0,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                // var assetImage = AssetImage('assets/icons/chair.png');
                return Container(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Product()),
                    );
                  },
                  child: Stack(clipBehavior: Clip.none, children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: '\$',
                                      style: TextStyle(
                                          color: titlecolor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      children: [
                                    TextSpan(
                                        text: snapshot.data.docs[index]
                                            ['price'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: titlecolor,
                                            fontSize: 22))
                                  ])),
                              Text(
                                snapshot.data.docs[index]['name'],
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: titlecolor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      height: objectsize(332, context),
                      width: objectsize(217, context),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(snapshot.data.docs == null
                                ? CircularProgressIndicator(
                                    backgroundColor: presscolor,
                                  )
                                : snapshot.data.docs[index]['url'])),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Colors.transparent,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          width: objectsize(196, context),
                          height: objectsize(360, context),
                          child: GestureDetector(
                            onTap: () {
                              showSnack(context, Text('Added to cart'), 1);
                            },
                            child: Container(
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                color: Colors.green,
                              ),
                              width: objectsize(60, context),
                              height: objectsize(60, context),
                            ),
                          ),
                          alignment: Alignment.bottomRight),
                    ),
                  ]),
                ));
              },
              itemCount: snapshot.data.docs.length,
            );
          }),
    );
  }
}

class MainTab extends StatelessWidget {
  const MainTab({
    Key key,
    @required TabController itabController,
  })  : _itabController = itabController,
        super(key: key);

  final TabController _itabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: _itabController,
      children: [
        TabPageView(),
        TabPageView(),
        TabPageView(),
      ],
    );
  }
}

class WholePageTab extends StatelessWidget {
  const WholePageTab({
    Key key,
    @required TabController itabController,
  })  : _itabController = itabController,
        super(key: key);

  final TabController _itabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: objectsize(316, context),
      child: MainTab(itabController: _itabController),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
