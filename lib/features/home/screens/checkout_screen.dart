import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import '../../../core/usecases/constants.dart';
import 'package:flutter/material.dart';
import '../models/booking_model.dart';


class CheckoutScreen extends StatefulWidget {
  final BookingModel booking;
  static String routeName = 'CheckoutScreen';
  const CheckoutScreen({required this.booking, super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? selectedPaymentMethod;
  final List<Map<String, String>> paymentMethods = [
    {"icon": "💳", "name": "Credit Card"},
    {"icon": "🅿️", "name": "PayPal"},
    {"icon": "💸", "name": "Google Pay"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'checkout'.tr(),
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.theme.colorScheme.surface,
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary
            Text(
              'book_summary'.tr(),
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.theme.colorScheme.primary,
              ),
            ),
            SizedBox(height: 8),
            Card(
              child: ListTile(
                title: Text(
                  'you_have_booked'.tr(
                    args: [
                      widget.booking.court,
                      (DateFormat('EEEE, MMM d, yyyy').format(widget.booking.date.toDate())),
                      '${widget.booking.time}',
                      '${widget.booking.duration}',
                    ],
                  ),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.theme.colorScheme.primary,
                  ),
                ),
                // subtitle: Text('Quantity: 1'),
                // trailing: Text('\$99.99'),
              ),
            ),
            const SizedBox(height: 16),

            // Payment Method
            Text(
              'select_payment_method'.tr(),
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: paymentMethods.length,
              itemBuilder: (context, index) {
                final method = paymentMethods[index];
                return Card(
                  child: ListTile(
                    leading: Text(
                      '${method['icon']}',
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: context.theme.colorScheme.primary,
                      ),
                    ),
                    title: Text(
                      '${method['name']}',
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.theme.colorScheme.primary,
                      ),
                    ),
                    trailing: Radio<String>(
                      value: '${method['name']}',
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value!;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),

            // Proceed Button
            ElevatedButton(
              onPressed: () async {
                if (selectedPaymentMethod == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('please_select_payment_method'.tr(),
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.theme.colorScheme.surface,
                        ),
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('proceeding_with_payment'.tr(args: ['$selectedPaymentMethod']),
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.theme.colorScheme.surface,
                        ),
                      ),
                      // content: Text('Proceeding with $selectedPaymentMethod payment.'),
                    ),
                  );
                  await Future.delayed(Duration(seconds: 3));
                  await _confirmBooking();
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  double.infinity,
                  48,
                ),
              ),
              child: Text(
                'confirm_and_pay'.tr(),
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.surface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmBooking() async {
    await firestore.collection('bookings')
        .add(widget.booking.toJson())
        .then((value) {
      _showConfirmationDialog();
    });
  }

  Future<void> _showConfirmationDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.theme.primaryColor,
        title: Text('booking_confirmed'.tr()),
        content: Text(
          'you_have_booked'.tr(
            args: [
              widget.booking.court,
              (DateFormat('EEEE, MMM d, yyyy').format(widget.booking.date.toDate())),
              '${widget.booking.time}',
              '${widget.booking.duration}',
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              Navigator.pop(context); // Go back to the main screen
              Navigator.pop(context); // Go back to the main screen
            },
            child: Text(
              'ok'.tr(),
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
