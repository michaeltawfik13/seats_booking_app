import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketres/Cubit/cubit/cubit.dart';
import 'package:ticketres/Cubit/cubit/states.dart';
import 'package:ticketres/components/Ticket.dart';

class SeatTest extends StatefulWidget {
  const SeatTest({Key? key}) : super(key: key);

  @override
  State<SeatTest> createState() => _BusLayoutState();
}

class _BusLayoutState extends State<SeatTest> {
  Set<SeatNumber> selectedSeats = {};

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>
      (
        builder: (context,state)
        {
          var model = SocialCubit.get(context).updateSeat;

          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    const Text("درب الصليب 2023",style: TextStyle(color: Colors.white),),
                    const SizedBox(
                      height: 32,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SeatLayoutWidget(
                              onSeatStateChanged: (rowI, colI, seatState) {
                                if (seatState == SeatState.selected) {
                                  selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));

                                } else {
                                  selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                                }
                              },
                              stateModel:  SeatLayoutStateModel(
                                rows: 8,
                                cols: 6,
                                seatSvgSize: 20,
                                pathSelectedSeat: 'assets/seat_selected.svg',
                                pathDisabledSeat: 'assets/seat_disabled.svg',
                                pathSoldSeat: 'assets/seat_sold.svg',
                                pathUnSelectedSeat: 'assets/seat_unselected.svg',
                                currentSeatsState: [
                                  [

                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    // SeatState.sold,
                                    // SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.sold,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],

                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            SeatLayoutWidget(
                              onSeatStateChanged: (rowI, colI, seatState) {
                                if (seatState == SeatState.selected) {
                                  selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));

                                } else {
                                  selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                                }
                              },
                              stateModel:  SeatLayoutStateModel(
                                rows: 8,
                                cols: 6,
                                seatSvgSize: 20,
                                pathSelectedSeat: 'assets/seat_selected.svg',
                                pathDisabledSeat: 'assets/seat_disabled.svg',
                                pathSoldSeat: 'assets/seat_sold.svg',
                                pathUnSelectedSeat: 'assets/seat_unselected.svg',
                                currentSeatsState: [
                                  [

                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    // SeatState.sold,
                                    // SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],

                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            SeatLayoutWidget(
                              onSeatStateChanged: (rowI, colI, seatState) {
                                if (seatState == SeatState.selected) {
                                  selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));

                                } else {
                                  selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                                }
                              },
                              stateModel:  SeatLayoutStateModel(
                                rows: 8,
                                cols: 6,
                                seatSvgSize: 20,
                                pathSelectedSeat: 'assets/seat_selected.svg',
                                pathDisabledSeat: 'assets/seat_disabled.svg',
                                pathSoldSeat: 'assets/seat_sold.svg',
                                pathUnSelectedSeat: 'assets/seat_unselected.svg',
                                currentSeatsState: [
                                  [

                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    // SeatState.sold,
                                    // SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],

                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            SeatLayoutWidget(
                              onSeatStateChanged: (rowI, colI, seatState) {
                                if (seatState == SeatState.selected) {
                                  selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));

                                } else {
                                  selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                                }
                              },
                              stateModel:  SeatLayoutStateModel(
                                rows: 8,
                                cols: 6,
                                seatSvgSize: 20,
                                pathSelectedSeat: 'assets/seat_selected.svg',
                                pathDisabledSeat: 'assets/seat_disabled.svg',
                                pathSoldSeat: 'assets/seat_sold.svg',
                                pathUnSelectedSeat: 'assets/seat_unselected.svg',
                                currentSeatsState: [
                                  [

                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    // SeatState.sold,
                                    // SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],

                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            SeatLayoutWidget(
                              onSeatStateChanged: (rowI, colI, seatState) {
                                if (seatState == SeatState.selected) {
                                  selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));

                                } else {
                                  selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                                }
                              },
                              stateModel:  SeatLayoutStateModel(
                                rows: 8,
                                cols: 6,
                                seatSvgSize: 20,
                                pathSelectedSeat: 'assets/seat_selected.svg',
                                pathDisabledSeat: 'assets/seat_disabled.svg',
                                pathSoldSeat: 'assets/seat_sold.svg',
                                pathUnSelectedSeat: 'assets/seat_unselected.svg',
                                currentSeatsState: [
                                  [

                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    // SeatState.sold,
                                    // SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],

                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            SeatLayoutWidget(
                              onSeatStateChanged: (rowI, colI, seatState) {
                                if (seatState == SeatState.selected) {
                                  selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));

                                } else {
                                  selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                                }
                              },
                              stateModel:  SeatLayoutStateModel(
                                rows: 8,
                                cols: 6,
                                seatSvgSize: 20,
                                pathSelectedSeat: 'assets/seat_selected.svg',
                                pathDisabledSeat: 'assets/seat_disabled.svg',
                                pathSoldSeat: 'assets/seat_sold.svg',
                                pathUnSelectedSeat: 'assets/seat_unselected.svg',
                                currentSeatsState: [
                                  [

                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    // SeatState.sold,
                                    // SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],

                                ],
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            SeatLayoutWidget(
                              onSeatStateChanged: (rowI, colI, seatState) {
                                if (seatState == SeatState.selected) {
                                  selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));

                                } else {
                                  selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                                }
                              },
                              stateModel:  SeatLayoutStateModel(
                                rows: 8,
                                cols: 6,
                                seatSvgSize: 20,
                                pathSelectedSeat: 'assets/seat_selected.svg',
                                pathDisabledSeat: 'assets/seat_disabled.svg',
                                pathSoldSeat: 'assets/seat_sold.svg',
                                pathUnSelectedSeat: 'assets/seat_unselected.svg',
                                currentSeatsState: [
                                  [

                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    // SeatState.sold,
                                    // SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],

                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            SeatLayoutWidget(
                              onSeatStateChanged: (rowI, colI, seatState) {
                                if (seatState == SeatState.selected) {
                                  selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));

                                } else {
                                  selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                                }
                              },
                              stateModel:  SeatLayoutStateModel(
                                rows: 8,
                                cols: 6,
                                seatSvgSize: 20,
                                pathSelectedSeat: 'assets/seat_selected.svg',
                                pathDisabledSeat: 'assets/seat_disabled.svg',
                                pathSoldSeat: 'assets/seat_sold.svg',
                                pathUnSelectedSeat: 'assets/seat_unselected.svg',
                                currentSeatsState: [
                                  [

                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    // SeatState.sold,
                                    // SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],

                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            SeatLayoutWidget(
                              onSeatStateChanged: (rowI, colI, seatState) {
                                if (seatState == SeatState.selected) {
                                  selectedSeats.add(SeatNumber(rowI: rowI, colI: colI));

                                } else {
                                  selectedSeats.remove(SeatNumber(rowI: rowI, colI: colI));
                                }
                              },
                              stateModel:  SeatLayoutStateModel(
                                rows: 8,
                                cols: 6,
                                seatSvgSize: 20,
                                pathSelectedSeat: 'assets/seat_selected.svg',
                                pathDisabledSeat: 'assets/seat_disabled.svg',
                                pathSoldSeat: 'assets/seat_sold.svg',
                                pathUnSelectedSeat: 'assets/seat_unselected.svg',
                                currentSeatsState: [
                                  [

                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    SeatState.disabled,
                                    // SeatState.sold,
                                    // SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.sold,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],
                                  [
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                    SeatState.unselected,
                                  ],

                                ],
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 2),
                              const Text('Disabled')
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                color: Colors.lightBlueAccent,
                              ),
                              const SizedBox(width: 2),
                              const Text('Sold')
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(border: Border.all(color: const Color(0xff0FFF50))),
                              ),
                              const SizedBox(width: 2),
                              const Text('Available')
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                color: const Color(0xff0FFF50),
                              ),
                              const SizedBox(width: 2),
                              const Text('Selected by you')
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(()
                        {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>Ticket()));
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) => const Color(0xFFfc4c4e)),
                      ),
                      child: const Text('Show my selected seat numbers'),
                    ),
                    const SizedBox(height: 12),
                    Text(selectedSeats.join(" , "))

                  ],
                ),
              ),
            ),
          );
        },
        listener: (context,state)
        {

        }
    );
  }
}

class SeatNumber {
  final int rowI;
  final int colI;

  const SeatNumber({required this.rowI, required this.colI});

  @override
  bool operator ==(Object other) {
    return rowI == (other as SeatNumber).rowI && colI == other.colI;
  }

  @override
  int get hashCode => rowI.hashCode;

  @override
  String toString() {
    return '[$rowI][$colI]';
  }
}
