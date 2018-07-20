import 'package:flutter/material.dart';
import 'package:space_traveller/model/beans.dart';
import 'package:space_traveller/ui/style/text_style.dart';

class PlanetCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
      child: new Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          cardContainer(),
          imageContainer(),
        ],
      ),
    );
  }

  Widget imageContainer() {
    return new DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow:<BoxShadow>[
          BoxShadow(
            color: Colors.white30,
            offset: Offset(6.0,6.0),
            blurRadius: 6.0
          )
        ]
      ),
      child: new Image.asset(
            planet.image,
            width: 92.0,
            height: 92.0,
          ),
    );
  }

  Widget cardContainer() {
    return new Container(
      height: 126.0,
      margin: const EdgeInsets.only(left: 46.0),
      padding: const EdgeInsets.only(left: 52.0,top: 20.0),
      decoration: BoxDecoration(
        color: new Color(0xFF333366),
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 10.0),
              blurRadius: 10.0)
        ],
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(planet.name,
            style: headerTextStyle,
          ),
          new Container(height: 10.0),
          new Text(planet.location,
                  style: subHeaderTextStyle

          ),
          new Container(
                  margin: new EdgeInsets.symmetric(vertical: 8.0),
                  height: 2.0,
                  width: 18.0,
                  color: new Color(0xff00c6ff)
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                      child: _planetValue(
                              value: planet.distance,
                              image: 'assets/img/ic_distance.png')

              ),
              new Expanded(
                      child: _planetValue(
                              value: planet.gravity,
                              image: 'assets/img/ic_gravity.png')
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _planetValue({String value, String image}) {
    return new Row(
            children: <Widget>[
              new Image.asset(image, height: 12.0),
              new Container(width: 8.0),
              new Text(planet.gravity, style: regularTextStyle),
            ]
    );
  }

  final Planet planet;

  PlanetCard(this.planet);

}

class GradientAppBar extends StatelessWidget {
  final String title;

  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Container(
      color: Colors.blue,
      height: 60.0 + statusBarHeight,
      padding: new EdgeInsets.only(top: statusBarHeight),
      child: new DecoratedBox(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF3366FF),
                    const Color(0xFF00CCFF),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
        ),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Icon(Icons.menu),
            ),
            new Center(
              child: new Text(
                title,
                style: baseTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 26.0),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}