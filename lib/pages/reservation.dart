import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/custom_button.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dateFormat = DateFormat("yyyy-MM-dd");
  final _timeFormat = DateFormat("HH:mm");

  String? _name;
  int? _numberOfPeople;
  DateTime? _selectedDate;
  DateTime? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservacion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese numero de personas';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Numero de personas'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingresa nuemero de personas';
                  }
                  return null;
                },
                onSaved: (value) {
                  _numberOfPeople = int.tryParse(value!);
                },
              ),
              DateTimeField(
                format: _dateFormat,
                decoration: InputDecoration(labelText: 'Fecha'),
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: currentValue ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  return date;
                },
                onChanged: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
              DateTimeField(
                format: _timeFormat,
                decoration: InputDecoration(labelText: 'Hora'),
                onShowPicker: (context, currentValue) async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: currentValue != null
                        ? TimeOfDay.fromDateTime(currentValue) 
                        : TimeOfDay.now(),
                  );
                  
                  final selectedTime = DateTime(
                    0, 0, 0, time!.hour, time.minute);
                  return selectedTime;
                },
                onChanged: (time) {
                  setState(() {
                    _selectedTime = time;
                  });
                },
              ),
              CustomButton( 
                color: Color.fromARGB(156, 255, 23, 23), 
                text: 'Submit',
                iconVisible: false,
                textColor: Colors.white,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    print('Nombre: $_name');
                    print('Cantidad de personas: $_numberOfPeople');
                    print('Hora: $_selectedDate');
                    print('Fecha: $_selectedTime');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
