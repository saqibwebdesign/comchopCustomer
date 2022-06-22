import 'package:flutter/material.dart';

class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'All your favorites',
      image:
          'https://comchop.com/public/app/icon/onboarding1.png',
      discription:
          "Order from the best local restaurants with easy, on-demand delivery."),
  UnbordingContent(
      title: 'Free delivery offers',
      image:
          'https://comchop.com/public/app/icon/onboarding2.png',
      discription:
          "Free delivery for new customers via Apple Pay and others payment methods. "),
  UnbordingContent(
      title: 'Choose your food',
      image:
          'https://comchop.com/public/app/icon/onboarding3.png',
      discription:
          "Easily find your type of food craving and you’ll get delivery in wide range. "),
];
