import 'package:flutter/material.dart';
import 'package:ticketkurs/components/background_gradient_image.dart';
import 'package:ticketkurs/components/dark_borderless_button.dart';
import 'package:ticketkurs/components/movie_app_bar.dart';
import 'package:ticketkurs/components/movie_card.dart';
import 'package:ticketkurs/components/primary_rounder_button.dart';
import 'package:ticketkurs/components/red_rounded_action_button.dart';
import 'package:ticketkurs/const.dart';
import 'package:ticketkurs/model.dart';
import 'package:ticketkurs/screens/buy_ticket.dart';

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
            image: Image.network(
              backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.all(10.0)),
                const MovieAppBar(),
                const SizedBox(height: 50),  // Adjusted vertical space
                const Text(
                  'NEW.MOVIE',
                  style: TextStyle(
                    fontSize: 16.0,  // Slightly larger font for better visibility
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(movies[widget.index].logo),
                const SizedBox(height: 20),  // Added space between elements
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Changed to spaceBetween for better alignment
                    children: <Widget>[
                      Flexible(  // Wrap the buttons to adjust according to available space
                        child: DarkBorderlessButton(
                          text: 'Popular with Friends',
                          callback: () {},
                        ),
                      ),
                      const SizedBox(width: 10),  // Added space between buttons
                      Flexible(
                        child: DarkBorderlessButton(
                          text: age,
                          callback: () {},
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: PrimaryRoundedButton(
                          text: rating,
                          callback: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: SingleChildScrollView(  // Enable horizontal scroll for content
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Text(
                          year,
                          style: kSmallMainTextStyle,
                        ),
                        const SizedBox(width: 5),
                        Text('•', style: kPromaryColorTextStyle),
                        const SizedBox(width: 5),
                        Text(
                          categories,
                          style: kSmallMainTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 5),
                        Text('•', style: kPromaryColorTextStyle),
                        const SizedBox(width: 5),
                        Text(technology, style: kSmallMainTextStyle),
                      ],
                    ),
                  ),
                ),
                Image.asset('assets/images/divider.png'),
                RedRoundedActionButton(
                    text: 'BUY TICKET',
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyTicket(title: movies[widget.index].title),
                        ),
                      );
                    }),
                Expanded(
                  child: SingleChildScrollView(  // Allow horizontal scrolling for movie cards
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for (var index = 0; index < movies.length; index++)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),  // Added padding between movie cards
                            child: MovieCard(
                              title: movies[index].title,
                              imageLink: movies[index].imageURL,
                              active: index == widget.index,
                              callBack: () {
                                setState(() {
                                  widget.index = index;
                                });
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
