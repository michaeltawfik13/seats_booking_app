
import 'package:flutter/material.dart';
import 'package:ticketres/components/background_gradient_image.dart';
import 'package:ticketres/components/dark_borderless_button.dart';
import 'package:ticketres/components/details_screen.dart';
import 'package:ticketres/components/movie_app_bar.dart';
import 'package:ticketres/components/movie_card.dart';
import 'package:ticketres/components/primary_rounder_button.dart';
import 'package:ticketres/components/red_rounded_action_button.dart';
import 'package:ticketres/const.dart';
import 'package:ticketres/Models/model.dart';
import 'package:ticketres/screens/buy_ticket.dart';

class MyHomePage extends StatefulWidget {
  int index = 1;

  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final String backgroundImage = movies[widget.index].imageURL;
    final String age = movies[widget.index].age;
    final String rating = movies[widget.index].rating.toString();
    final String year = movies[widget.index].date.year.toString();
    final String categories = movies[widget.index].categorires;
    final String technology = movies[widget.index].technology;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BackgroundGradientImage(
            image: Image.asset(
              'assets/image/2.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.all(10.0)),
                const MovieAppBar(),
                const Padding(padding: EdgeInsets.symmetric(vertical: 50.0)),
                const Text(
                  'عرض درب الصليب',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'سكة سفر',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                //Image.asset('assets/image/joker.jpeg'),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: <Widget>[
                //     DarkBorderlessButton(
                //       text: 'Popular with Friends',
                //       callback: () {},
                //     ),
                //     DarkBorderlessButton(text: age, callback: () {}),
                //     PrimaryRoundedButton(
                //       text: rating,
                //       callback: () {},
                //     ),
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'انتاج و اخراج',
                          style: kSmallMainTextStyle,
                        ),
                        Text(
                          'فريق عمل كنيسة القديسه برباره بالشرابيه',
                          style: kSmallMainTextStyle,
                        ),
                        Text(
                          'لسنة 2022 - 2023',
                          style: kSmallMainTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                //Image.asset('assets/image/togo.jpeg'),
                RedRoundedActionButton(
                    text: 'احجز تذكرتك الان',
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyTicket(movies[widget.index].title),
                        ),
                      );
                    }),


              ],
            ),
          ),
        ],
      ),
    );
  }
}