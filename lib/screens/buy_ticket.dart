

import 'package:flutter/material.dart';
import 'package:ticketres/components/Seat_test.dart';
import 'package:ticketres/components/Ticket.dart';
import 'package:ticketres/components/calendar_day.dart';
import 'package:ticketres/components/cienma_seat.dart';
import 'package:ticketres/components/show_time.dart';

import '../const.dart';

class BuyTicket extends StatelessWidget {
  final title;

  const BuyTicket(this.title, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:15.0 , left:15.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * .12,
                      height: MediaQuery.of(context).size.width * .12,
                      decoration: kRoundedFadedBorder,
                      child: IconButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.white,
                            size: 28.0,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .75,
                      child: Text(
                        'سكة سفر',
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.5,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery.of(context).size.width * .9,
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
                  child: Row(
                    children: const <Widget> [
                      Expanded(
                        child: CalendarDay(
                          dayNumber: '2/4',
                          dayAbbreviation: 'الاحد',
                          isActive: true,
                        ),
                      ),
                      Expanded(
                        child: CalendarDay(
                          dayNumber: '1/4',
                          dayAbbreviation: 'السبت',
                          isActive: true,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Center(child: Text('السبت',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>SeatTest()));
                    },
                    child: ShowTime(
                      time: '7:30',
                      price: 50  ,
                      isActive: false,
                    ),
                  ),

                ],
              ),
              Center(child: Text('الاحد',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>SeatTest()));
                      },
                      child: ShowTime(
                        time: '7:30',
                        price: 50  ,
                        isActive: false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>SeatTest()));
                      },
                      child: ShowTime(
                        time: '4:30',
                        price: 45  ,
                        isActive: false,
                      ),
                    ),
                  ),
                  // ShowTime(
                  //   time: '12:30',
                  //   price: 10,
                  //   isActive: false,
                  // ),
                  // ShowTime(
                  //   time: '12:30',
                  //   price: 10,
                  //   isActive: false,
                  // ),
                  // ShowTime(
                  //   time: '12:30',
                  //   price: 10,
                  //   isActive: false,
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Icon(
                      Icons.tv,
                      color: kPimaryColor,
                      size: 25.0,
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('مسرح الانبا رويس بالكاتدرائيه المرقسيه ', style: kMainTextStyle),
                          // const Text('العباسيه',
                          // overflow: TextOverflow.ellipsis,
                          //     style:
                          //         TextStyle(color: Colors.white30, fontSize: 18.0)),
                          const SizedBox(height: 10.0),

                        ],
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      size: 30.0,
                      color: Colors.white38,
                    )
                  ],
                ),
              ),
              //Center(child: Image.asset('assets/images/screen.png')),

              Container(
                height: 50,
                width: double.infinity,
                child: MaterialButton(onPressed: ()
                {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=>SeatTest()));
                },color: Colors.red,child:
                Text('احجز مقعدك الان',style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),),
              )
            ],
          ),

        ),
      ),
    );
  }
}

