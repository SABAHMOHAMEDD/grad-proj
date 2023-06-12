import 'package:booking_calendar/booking_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grad_proj/const/const.dart';
import 'package:grad_proj/models/reservation_model.dart';
import 'package:grad_proj/screens/hospital/cubit/hospital_cubit.dart';
import 'package:grad_proj/screens/sign_in/cubit/cubit.dart';
import 'package:grad_proj/theme/mytheme.dart';

import '../../../models/doctor_model.dart';

class BookingDoctorScreen extends StatefulWidget {
  final DoctorModel doctor;
  final HospitalCubit cubit;
  const BookingDoctorScreen({Key? key, required this.doctor, required this.cubit}) : super(key: key);

  @override
  State<BookingDoctorScreen> createState() => _BookingDoctorScreenState();
}

class _BookingDoctorScreenState extends State<BookingDoctorScreen> {

  final now = DateTime.now();
  late BookingService mockBookingService;
  @override
  void initState() {
    super.initState();
    // DateTime.now().startOfDay
    // DateTime.now().endOfDay

    mockBookingService = BookingService(
        serviceName: 'Mock Service',
        serviceDuration: 30,
        bookingEnd: DateTime(now.year, now.month, now.day, 22, 40),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    String docId=generateRandomString(21);
    ReservationModel reservationModel = ReservationModel(
      rId: docId,
      bookingEnd: newBooking.bookingEnd,
      bookingStart: newBooking.bookingStart,
      pDOB: userModel!.DOB,
      pId:  userModel!.uId,
      pName: userModel!.name,
      pImage: userModel!.uImage,
      pPhone: userModel!.phone,
      dImg: widget.doctor.image,
      dBio: widget.doctor.bio,
      dId: widget.doctor.uId,
      dName: widget.doctor.name,
    );

    await Future.delayed(const Duration(seconds: 3));
    FirebaseFirestore.instance.collection('serviceProviders').doc('er3slW6BLMb0ZSS6oM9s').collection('doctors')
        .doc(widget.doctor.uId).collection('bookings').doc(docId).set(reservationModel.toMap()).then((value) {
      FirebaseFirestore.instance.collection('users').doc(userModel!.uId).collection('deals')
          .doc(docId).set(reservationModel.toMap()).then((value) {
        FirebaseFirestore.instance.collection('serviceProviders').doc('er3slW6BLMb0ZSS6oM9s').update(
            {'balance':(widget.cubit.hospital!.balance)!+(widget.doctor.price!)});
        converted.add(DateTimeRange(
            start: newBooking.bookingStart, end: newBooking.bookingEnd));
        print('${newBooking.toJson()} has been uploaded');
        setState(() {

        });
      }).catchError((onError){
        defToast(msg: onError.toString());
      });
    }).catchError((onError){
      defToast(msg: onError.toString());
    });



  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    ///take care this is only mock, so if you add today as disabledDays it will still be visible on the first load
    ///disabledDays will properly work with real data
    FirebaseFirestore.instance.collection('serviceProviders').doc('er3slW6BLMb0ZSS6oM9s').collection('doctors').doc(widget.doctor.uId).collection('bookings')
    .get().then((value) {
      value.docs.forEach((element) {
        setState(() {

        });
        converted.add(DateTimeRange(start: DateTime.parse(element.get('bookingStart').toDate().toString()), end: DateTime.parse(element.get('bookingEnd').toDate().toString())));

      });
    }).catchError((onError){
      // defToast(msg: onError.toString());
    });
    /*DateTime first = now;
    DateTime tomorrow = now.add(Duration(days: 1));
    DateTime second = now.add(const Duration(minutes: 55));
    DateTime third = now.subtract(const Duration(minutes: 240));
    DateTime fourth = now.subtract(const Duration(minutes: 500));
    converted.add(
        DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
    converted.add(DateTimeRange(
        start: second, end: second.add(const Duration(minutes: 23))));
    converted.add(DateTimeRange(
        start: third, end: third.add(const Duration(minutes: 15))));
    converted.add(DateTimeRange(
        start: fourth, end: fourth.add(const Duration(minutes: 50))));
    converted.add(DateTimeRange(
        start: DateTime(now.year,now.month,now.day,11,30), end: DateTime(now.year,now.month,now.day,12,0), ));

    //book whole day example
    converted.add(DateTimeRange(
        start: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 9, 0),
        end: DateTime(tomorrow.year, tomorrow.month, tomorrow.day, 9, 31)));*/
    return converted;
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 00, 1),
          end: DateTime(now.year, now.month, now.day, now.hour, now.minute))
    ];
  }

  @override
  Widget build(BuildContext context) {
    widget.cubit.hospital!.balance;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Booking Calendar ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Booking Calendar '),
            backgroundColor: MyTheme.primaryH,
          ),
          body: Center(
            child: BookingCalendar(
              selectedSlotColor: Colors.yellow.shade400,
              bookedSlotColor: Colors.redAccent.withOpacity(0.8),
              availableSlotColor: Colors.greenAccent.withOpacity(0.8),
              pauseSlotColor: Colors.grey.shade400,
              bookingButtonColor: MyTheme.primaryH,
              bookingService: mockBookingService,
              convertStreamResultToDateTimeRanges: convertStreamResultMock,
              getBookingStream: getBookingStreamMock,
              uploadBooking: uploadBookingMock,
              pauseSlots: generatePauseSlots(),
              pauseSlotText: 'OFF',
              hideBreakTime: false,
              loadingWidget: const Text('Fetching data...'),
              uploadingWidget: const CircularProgressIndicator(),
              locale: 'en_US',
              startingDayOfWeek: StartingDayOfWeek.saturday,
              wholeDayIsBookedWidget:
              const Text('Sorry, for this day everything is booked'),
              lastDay: now.add(Duration(days: 7)),
              //disabledDates: [DateTime(2023, 1, 20)],
              //disabledDays: [6, 7],
            ),
          ),
        ));
  }
}
