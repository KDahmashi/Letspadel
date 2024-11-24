import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:padel/core/usecases/constants.dart';
import '../../home/models/booking_model.dart';
import 'package:flutter/material.dart';


class MyBookingScreen extends StatelessWidget {
  static String routeName = 'MyBookingScreen';
  const MyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'my_bookings'.tr(),
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection('bookings')
            .where('user', isEqualTo: auth.currentUser?.uid)
            .orderBy('createAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                BookingModel booking = BookingModel.fromJson(
                  snapshot.data?.docs[index].data() as Map<String, dynamic>,
                );
                return Card(
                  child: ListTile(
                    title: Text(
                      snapshot.data?.docs[index]['court'],
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'date'.tr(args: [dateFormat.format(booking.date.toDate())]),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.theme.colorScheme.outlineVariant,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                        booking.city,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.theme.colorScheme.outlineVariant,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'time'.tr(args: ['${booking.time}']),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.theme.colorScheme.outlineVariant,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'duration'.tr(args: ['${booking.duration}']),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                    trailing: (booking.status == 'confirmed')
                        ? IconButton(
                            icon: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      'cancel_booking'.tr(),
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Text(
                                      'cancel_booking_message'.tr(),
                                      textAlign: TextAlign.center,
                                    ),
                                    backgroundColor: context.theme.primaryColor,
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'cancel'.tr(),
                                          style: context.textTheme.bodyMedium?.copyWith(
                                            color: context.theme.colorScheme.onPrimary,
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          firestore.collection('bookings')
                                              .doc(snapshot.data?.docs[index].id)
                                              .update({'status': 'cancelled'});
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'yes'.tr(),
                                          style: context.textTheme.bodyMedium?.copyWith(
                                            color: context.theme.colorScheme.onPrimary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          )
                        : Icon(
                            Icons.cancel,
                            color: Colors.red,
                          ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
