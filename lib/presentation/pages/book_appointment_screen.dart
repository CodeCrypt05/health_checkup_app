import 'package:flutter/material.dart';
import 'package:health_checkup_app/data/appointment_dates_list.dart';
import 'package:health_checkup_app/presentation/theme/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final DateTime today = DateTime.now();
  DateTime _focusDay = DateTime.now();
  DateTime? _selectedDay;

  // focus on the current date
  @override
  void initState() {
    super.initState();
    _selectedDay = _focusDay;
  }

  bool _isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Appointment'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _selectDate(size),
                _buildCalendar(size),
                _selectTime(size),
                _buildTimeList(size),
              ],
            ),
          ),
          schedule_btn(size),
        ],
      ),
    );
  }

  Widget _selectDate(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.04,
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Text(
        'Select Date',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildCalendar(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Card(
        elevation: 2,
        child: Column(
          children: [
            TableCalendar(
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              startingDayOfWeek: StartingDayOfWeek.sunday,
              focusedDay: _focusDay,
              firstDay: DateTime.now(),
              lastDay: DateTime(2050),
              //weekends date show in red color
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Colors.red),
              ),
              calendarStyle: CalendarStyle(
                weekendTextStyle: TextStyle(color: Colors.red),
                todayDecoration: BoxDecoration(
                    color: AppColors.primaryColor, shape: BoxShape.circle),
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryColor,
                ),
              ),
              onDaySelected: (selectedDay, focusDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(
                    () {
                      _selectedDay = selectedDay;
                      _focusDay = focusDay;
                    },
                  );
                }
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day) &&
                    day.weekday != DateTime.saturday &&
                    day.weekday != DateTime.sunday;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectTime(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.04,
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 18),
      child: const Text(
        'Select Time',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTimeList(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.26,
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 18,
          mainAxisSpacing: 12,
          crossAxisCount: 3,
          mainAxisExtent: 44,
        ),
        itemCount: time.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: GridTile(
              child: Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 2.0,
                  ),
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      time[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget schedule_btn(Size size) {
    return Container(
      width: double.infinity,
      height: size.height * 0.06,
      margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(69, 69, 202, 1),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
        ),
        child: const Text(
          'Next',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
