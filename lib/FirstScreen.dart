import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CircleAvatar(
          backgroundColor: Colors.deepPurpleAccent,
          radius: 18,
          child: Icon(Icons.lightbulb, color: Colors.white),
        ),
        actions: [
          IconButton(
              icon:Icon(Icons.video_call_outlined, color: Colors.deepPurple),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.calendar_today,color: Colors.deepPurple),
            onPressed: (){},
          ),
        ],
      ),
      body:Container(
        child: ListView(
          children: [
            LimitedBox(
              maxHeight:220,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  AddSlider(sliderImage: "https://images.pexels.com/photos/3109793/pexels-photo-3109793.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  AddSlider(sliderImage: "https://images.pexels.com/photos/4175054/pexels-photo-4175054.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  AddSlider(sliderImage: "https://images.pexels.com/photos/5852288/pexels-photo-5852288.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  AddSlider(sliderImage: "https://images.pexels.com/photos/4793421/pexels-photo-4793421.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                ],  
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class AddSlider extends StatelessWidget {
final String sliderImage;

AddSlider({this.sliderImage});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(sliderImage,fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}

