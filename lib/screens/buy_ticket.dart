import 'package:flutter/material.dart';
import 'package:ticketkurs/components/calendar_day.dart';
import 'package:ticketkurs/components/cienma_seat.dart';
import 'package:ticketkurs/components/show_time.dart';

import '../const.dart';

class BuyTicket extends StatefulWidget {
  final String title;

  const BuyTicket({Key? key, required this.title}) : super(key: key);

  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  String selectedDate = '12 SU';
  String selectedTime = '12:30';
  String selectedCinema = 'Chaplin MEGA Silk Way';
  int selectedPrice = 10;
  List<String> selectedSeats = [];

  final List<String> cinemas = [
    'Chaplin MEGA Silk Way',
    'Cinema Park Keruen',
    'Arman 3D Cinema',
  ];

  void toggleSeatSelection(String seat) {
    print("toggleSeatSelection called for $seat");
    setState(() {
      if (selectedSeats.contains(seat)) {
        selectedSeats.remove(seat);
        print("Deselected: $seat");
      } else {
        selectedSeats.add(seat);
        print("Selected: $seat");
      }
    });
  }

  void bookSeats() {
    if (selectedSeats.isEmpty) {
      print("selected seats array ${selectedSeats}");
      print(selectedCinema);
      print(selectedDate);
      print(selectedPrice);
      print(selectedTime);

      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text("Please select at least one seat!"),
      //     backgroundColor: Colors.red,
      //   ),
      // );
      // return;
    }

    final message =
        "Selected Details:\n\nDate: $selectedDate\nTime: $selectedTime\nCinema: $selectedCinema\nSeats: ${selectedSeats.join(", ")}\nTotal Price: \$${selectedPrice * selectedSeats.length}";

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Booking Details"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Build method called!");
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: screenWidth * .12,
                      height: screenWidth * .12,
                      decoration: kRoundedFadedBorder,
                      child: IconButton(
                        icon: const Icon(Icons.keyboard_arrow_left, size: 28.0),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * .7,
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                width: screenWidth * .9,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(5, (index) {
                        String day = (9 + index).toString();
                        String abbreviation =
                            ['TH', 'FR', 'SA', 'SU', 'MO'][index];
                        bool isActive = selectedDate == '$day $abbreviation';
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDate = '$day $abbreviation';
                            });
                          },
                          child: CalendarDay(
                            dayNumber: day,
                            dayAbbreviation: abbreviation,
                            isActive: isActive,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: ['11:00', '12:30', '14:00', '16:30'].map((time) {
                    // Define the price based on the time
                    int price = time == '12:30' ? 10 : 5;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTime = time;
                          selectedPrice = price;
                          print("Selected Time: $selectedTime");
                          print("Selected Price: $selectedPrice");
                        });
                      },
                      child: ShowTime(
                        time: time,
                        price: price,
                        isActive: selectedTime == time,
                        onTap: () {
                          setState(() {
                            selectedTime = time;
                            selectedPrice = price;
                            print("Selected Time: $selectedTime");
                            print("Selected Price: $selectedPrice");
                          });
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DropdownButton<String>(
                  value: selectedCinema,
                  dropdownColor: Colors.black,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  items: cinemas
                      .map((cinema) => DropdownMenuItem(
                            value: cinema,
                            child: Text(cinema),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCinema = value!;
                    });
                  },
                ),
              ),
              Center(child: Image.asset('assets/images/screen.png')),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: List.generate(7, (row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(7, (index) {
                        String seat = 'R${row + 1}S${index + 1}';
                        bool isSelected = selectedSeats.contains(seat);
                        bool isReserved = false; // Change based on your logic
                        return CienmaSeat(
                          isSelected: isSelected,
                          isReserved: isReserved,
                          onTap: () => toggleSeatSelection(seat),
                        );
                      }),
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        "\$${selectedPrice * selectedSeats.length}",
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: bookSeats,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kActionColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 10.0),
                      ),
                      child: const Text(
                        'Book Now',
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
