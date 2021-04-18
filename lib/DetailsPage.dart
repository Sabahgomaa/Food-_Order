import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DetailPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;

  DetailPage(this.heroTag, this.foodName, this.foodPrice);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var selectedCard ='WEIGHT';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: (){
              Navigator.of(context).pop();
            },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Details',
          style: TextStyle(
            fontFamily: 'Schyler',
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: (){},
              color: Colors.white,
          )
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height-82,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Positioned(
                top: 45.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height-100,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Positioned(
                top: 30,
                left: (MediaQuery.of(context).size.width/2)-100,
                child: Hero(
                    tag: widget.heroTag,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.heroTag),
                          fit: BoxFit.cover,
                        )
                      ),
                    )),
              ),
              Positioned(
                top: 25.0,
                  left: 25,
                  right: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                      Text(widget.foodName,
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text(
                            widget.foodPrice,
                            style: TextStyle(
                              fontFamily: 'Schyler',
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            width: 125,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Color(0xFF7A9BEE),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children:<Widget> [
                                InkWell(
                                  onTap: (){},
                                  child:Container(
                                    height:25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Color(0xFF7A9BEE)
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  )
                                ),
                                Text('1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Schyler'
                                ),
                                ),

                                InkWell(
                                    onTap: (){},
                                    child:Container(
                                      height:25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(7),
                                          color: Color(0xFF7A9BEE)
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.add_circle,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    )
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children:<Widget> [
                            _buildIfocard('heigh', '300 C', '0'),
                            SizedBox(width: 10,),
                            _buildIfocard('heigh', '300 C', '0'),
                            SizedBox(width: 10,),
                            _buildIfocard('heigh', '300 C', '0'),
                            SizedBox(width: 10,),
                            _buildIfocard('heigh', '300 C', '0'),
                          ],

                        ),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
Widget _buildIfocard(String cardTitle ,String info ,String unit) {
  var selectedCard = 'WEIGHT';
  return InkWell(
    onTap: () {
      SelsctedCard(cardTitle);
    },
    child: AnimatedContainer(
      duration: Duration(microseconds: 500),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
          border: Border.all(
            color: cardTitle == selectedCard ? Colors.transparent : Colors.grey
                .withOpacity(0.3),
            style: BorderStyle.solid,
            width: .75,
          )
      ),
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            cardTitle,
            style: TextStyle(
              fontFamily: 'Schyler',
              fontSize: 14,
              color: cardTitle == selectedCard ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15,bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                Text(
                  info,
                  style: TextStyle(
                    fontFamily: 'Schyler',
                    fontSize: 12,
                    color: cardTitle == selectedCard ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Text(
            unit,
            style: TextStyle(
              fontFamily: 'Schyler',
              fontSize: 12,
              color: cardTitle == selectedCard ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
  SelsctedCard(cardTitle) {
    setState() {
      var selectedCard = cardTitle;
    }
  }
