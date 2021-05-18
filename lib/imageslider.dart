import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class imageslider extends StatefulWidget {
  @override
  _imagesliderState createState() => _imagesliderState();
}

class _imagesliderState extends State<imageslider> {
  @override
  Widget build(BuildContext context) {
    Widget image_slider = Container(
      // height: 300,
      height: 220,
      child: Carousel(
        images: [
          Image.network(
            "https://cdn.hipwallpaper.com/i/12/36/RNyEa1.jpg",
            fit: BoxFit.fill,
          ),
          Image.network(
            "https://c4.wallpaperflare.com/wallpaper/192/432/23/background-hd-nature-scenes-1920x1200-wallpaper-preview.jpg",
            fit: BoxFit.fill,
          ),
          Image.network(
            "https://img.wallpapersafari.com/desktop/1536/864/84/21/d4kCqo.jpg",
            fit: BoxFit.fill,
          ),
          Image.network(
            "https://i.pinimg.com/originals/55/d7/f4/55d7f429958df0276751dbb7c7567c59.jpg",
            fit: BoxFit.fill,
          ),
          Image.network(
            "https://wallpaperaccess.com/full/267434.jpg",
            fit: BoxFit.fill,
          ),
        ],
        autoplay: true,
        indicatorBgPadding: 1.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1F618D),
        title: Text("Image Slider"),
        centerTitle: true,
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: const Color(0xff1F618D),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              image_slider,
            ],
          ),
        ),
      ),
    );
  }
}
