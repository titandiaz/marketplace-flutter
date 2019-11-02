import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class BannerSwiper extends StatelessWidget {
  // const BannerSwiper({Key key}) : super(key: key);

  final List<dynamic> banners;

  BannerSwiper({ @required this.banners });

  @override
  Widget build(BuildContext context) {

    // final _screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 290.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          // return new Image.network('http://via.placeholder.com/350x250', fit: BoxFit.cover);
          return new Image.asset('assets/banner.jpg', fit: BoxFit.cover);
        },
        itemCount: banners.length,
        pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
}}