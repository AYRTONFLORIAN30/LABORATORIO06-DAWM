import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendario Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatelessWidget {
  final List<String> daysOfWeek = [
    'Lunes',
    'Martes',
    'Miércoles',
    'Jueves',
    'Viernes',
    'Sábado',
    'Domingo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendario', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildCalendar()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: daysOfWeek.map((day) {
          return Text(
            day,
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCalendar() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1.2,
      ),
      itemCount: 30,
      itemBuilder: (context, index) {
        return _buildDayCard(index + 1);
      },
    );
  }

  Widget _buildDayCard(int day) {
    final now = DateTime.now();
    final today = DateFormat('d').format(now);
    final isToday = day == int.parse(today);

    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isToday ? Colors.white : Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          '$day',
          style: TextStyle(
            color: isToday ? Colors.black : Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
