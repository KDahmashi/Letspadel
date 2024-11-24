import 'package:padel/features/home/models/court_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:padel/core/usecases/constants.dart';
import 'package:go_router/go_router.dart';
import '../screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import '../models/booking_model.dart';



class BookingDetails extends StatefulWidget {
  final CourtModel court;

  const BookingDetails({super.key, required this.court});

  @override
  _BookingDetailsState createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  int _duration = 1; // in hours

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'book_name'.tr(args: [(widget.court.name)]),
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            // fontSize: 24,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display court details
            Text(
              widget.court.name,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.theme.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 8),
            Text(
              widget.court.description,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.theme.colorScheme.outlineVariant,
              ),
            ),
            SizedBox(height: 16),
            // Date picker
            ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: context.theme.colorScheme.primary,
              ),
              title: Text(
                _selectedDate == null
                    ? 'select_date'.tr()
                    : 'date'.tr(args: [(DateFormat('EEEE, MMM d, yyyy').format(_selectedDate!))]),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
              ),
              onTap: _pickDate,
            ),
            // Time picker
            ListTile(
              leading: Icon(
                Icons.access_time,
                color: context.theme.colorScheme.primary,
              ),
              title: Text(
                _selectedTime == null ? 'select_time'.tr() :
                'time'.tr(args: ['${_selectedTime?.format(context)}']),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
              ),
              onTap: _pickTime,
            ),
            // Duration selector
            ListTile(
              leading: Icon(
                Icons.timer,
                color: context.theme.colorScheme.primary,
              ),
              title: Text(
                'duration'.tr(args: ['$_duration']),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
              ),
              trailing: DropdownButton<int>(
                value: _duration,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
                dropdownColor: context.theme.colorScheme.onPrimary,
                items: [1, 2, 3].map((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text('hour'.tr(args: ['$value']),
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.theme.colorScheme.primary,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _duration = newValue!;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            // Book button
            ElevatedButton(
              child: Text('confirm_booking'.tr()),
              onPressed: () {
                if (_selectedDate == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('please_select_date'.tr(),
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.theme.colorScheme.surface,
                        ),
                      ),
                    ),
                  );
                } else if (_selectedTime == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('please_select_time'.tr(),
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.theme.colorScheme.surface,
                        ),
                      ),
                    ),
                  );
                } else {
                  Timestamp date = Timestamp.fromDate(_selectedDate!);
                  String? time = _selectedTime?.format(context);
                  BookingModel booking = BookingModel(
                    city: widget.court.location.city,
                    courtId: widget.court.courtId,
                    user: auth.currentUser?.uid,
                    court: widget.court.name,
                    createAt: Timestamp.now(),
                    status: 'confirmed',
                    duration: _duration,
                    date: date,
                    time: time,
                  );
                  context.pushNamed(CheckoutScreen.routeName,
                    extra: booking,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _pickDate() async {
    DateTime initialDate = _selectedDate ?? DateTime.now().add(Duration(days: 1));
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (BuildContext context, Widget? child) {
        // Custom theme will be applied here
        return Theme(
          data: ThemeData(
            primaryColor: context.theme.primaryColor,
          ),
          child: child!,
        );
      },
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  void _pickTime() async {
    TimeOfDay initialTime = _selectedTime ?? TimeOfDay.now();
    TimeOfDay? time = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      // showTitleActions: true,
      initialTime: initialTime,
      context: context,
      builder: (BuildContext context, Widget? child) {
        // Custom theme will be applied here
        return Theme(
          data: ThemeData(
            primaryColor: context.theme.primaryColor,
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          ),
        );
      },
    );
    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

}
