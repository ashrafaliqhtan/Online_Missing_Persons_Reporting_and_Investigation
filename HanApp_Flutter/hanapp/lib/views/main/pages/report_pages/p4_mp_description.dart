import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

// shared preferences for state management
late SharedPreferences _prefs;
void clearPrefs() {
  _prefs.clear();
}

class Page4MPDesc extends StatefulWidget {
  const Page4MPDesc({super.key});

  @override
  State<Page4MPDesc> createState() => _Page4MPDescState();
}

class _Page4MPDescState extends State<Page4MPDesc> {
  /* FORMATTING */
  static const TextStyle optionStyle = TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54);
  static const _verticalPadding = SizedBox(height: 10);

  // local variables for text fields
  // MP Appearance
  String? mp_scars;
  String? mp_marks;
  String? mp_tattoos;
  String? mp_hair_color;
  bool? mp_hair_color_natural;
  String? mp_eye_color;
  bool? mp_eye_color_natural;
  String? mp_prosthetics;
  String? mp_birth_defects;
  String? last_clothing;
  // MP medical details
  String? mp_height;
  String? mp_weight;
  String? mp_blood_type;
  String? mp_medications;
  // MP socmed details
  String? mp_facebook;
  String? mp_twitter;
  String? mp_instagram;
  String? mp_socmed_other;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 100,
        left: 20,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: const Text(
                'Page 4: Absent/Missing Person Description',
                style: optionStyle,
              ),
            ),
            _verticalPadding,
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: const Text(
                'Scars, Marks, and Tattoos',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            _verticalPadding,
            // text fields for Scars
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextField(
                onChanged: (value) {
                  mp_scars = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Scars',
                ),
              ),
            ),
            _verticalPadding,
            // text fields for Marks
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextField(
                onChanged: (value) {
                  mp_marks = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Marks',
                ),
              ),
            ),
            _verticalPadding,
            // text fields for Tattoos
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextField(
                onChanged: (value) {
                  mp_tattoos = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tattoos',
                ),
              ),
            ),
            _verticalPadding,
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: const Text(
                'Hair Color',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            _verticalPadding,
            // text fields for Hair Color
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextField(
                onChanged: (value) {
                  mp_hair_color = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Hair Color',
                ),
              ),
            ),
            _verticalPadding,
            // NOTE! Insert checkbox for Hair Color Natural
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: const Text(
                'Eye Color',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            _verticalPadding,
            // text fields for Eye Color
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextField(
                onChanged: (value) {
                  mp_eye_color = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Eye Color',
                ),
              ),
            ),
            _verticalPadding,
            // NOTE! Insert checkbox for Eye Color Natural
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: const Text(
                'Prosthetics',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            _verticalPadding,
            // text fields for Prosthetics
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextField(
                onChanged: (value) {
                  mp_prosthetics = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Prosthetics',
                ),
              ),
            ),
            _verticalPadding,
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: const Text(
                'Birth Defects',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            _verticalPadding,
            // text fields for Birth Defects
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextField(
                onChanged: (value) {
                  mp_birth_defects = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Birth Defects',
                ),
              ),
            ),
            _verticalPadding,
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: const Text(
                'Last Known Clothing and Accessories',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            _verticalPadding,
            // big text field for Last Known Clothing and Accessories
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextField(
                onChanged: (value) {
                  last_clothing = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Known Clothing and Accessories',
                ),
              ),
            ),
            _verticalPadding,
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: const Text(
                'Medical Details',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
            _verticalPadding,
            // text fields for Height
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextField(
                onChanged: (value) {
                  mp_height = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Height (feet and inches)',
                ),
              ),
            ),
            _verticalPadding,
            // text fields for Weight
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: TextField(
                onChanged: (value) {
                  mp_weight = value;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Weight (kg)',
                ),
              ),
            ),
            _verticalPadding,
            // dropdown for Blood Type
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              child: DropdownButtonFormField<String>(
                // text to display when no value is selected
                hint: const Text("Blood Type"),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                value: mp_blood_type,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.black54),
                onChanged: (String? newValue) {
                  setState(() {
                    mp_blood_type = newValue;
                  });
                },
                items: <String>[
                  'A+',
                  'A-',
                  'B+',
                  'B-',
                  'AB+',
                  'AB-',
                  'O+',
                  'O-',
                  'Unknown',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
