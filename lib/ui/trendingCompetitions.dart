import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:zigwan_demo/main.dart';

class TrendingCompetitions extends StatelessWidget {
  var url1 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsdHkWJVisKCslDjIqzIdFI4P96hhvfZz8qJq1MTNH4ksPPqI9Jg";
  var url2 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAbgfvOkUmMmNg4lDvpDV1NLFIlhcJEWRsJToL2IPgCXh36WSq";
  var url3 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdW_ku49ZIwEiXVBqwQ30f3G8C3vTO-oECLCoaGcM5_y5pRM9jDQ";
  var url4 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROIz7Yeo62izwb6vxRvGg7uv6ksEk0Y10hflEY-ubcCYkjSyKU_g";
  var url5 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpjlAdJum0BhVookqbPf3MuOpaNW80sQT0Edo0lTb8sJ9thXSPBQ";

  @override
  Widget build(BuildContext context) {
    Widget _helper(ur) {
      return InkWell(
        child: Container(
          decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: new Border.all(
                  color: Colors.white, width: 5.0, style: BorderStyle.solid),
              image: new DecorationImage(
                  image: new NetworkImage(ur), fit: BoxFit.cover)),
        ),
        onTap: () {
        },
      );
    }

    return Container(
        height: 170,
        color: Colors.white,
        margin: EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
        child: ListView(
          children: <Widget>[
            Text(
              "  Top trending competitions",
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            CarouselSlider(
                height: 140,
                viewportFraction: 0.6,
                aspectRatio: 16 / 9,
                distortion: false,
                items: [
                  _helper(url1),
                  _helper(url2),
                  _helper(url3),
                  _helper(url4),
                  _helper(url5),
                ]),
          ],
        ));
  }
}