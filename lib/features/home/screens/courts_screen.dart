import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/usecases/constants.dart';
import '../widgets/booking_details.dart';
import 'package:flutter/material.dart';
import '../models/court_model.dart';
import '../widgets/club_card.dart';


class CourtsScreen extends StatefulWidget {
  static String routeName = 'CourtsScreen';

  const CourtsScreen({super.key});

  @override
  State<CourtsScreen> createState() => _CourtsScreenState();
}

class _CourtsScreenState extends State<CourtsScreen> {

  final List<String> items = [
    'Riyadh',
    'Jeddah',
    'Mecca',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'courts'.tr(),
          style: context.textTheme.bodyLarge?.copyWith(
            color: context.theme.colorScheme.surface,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 1),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.primary,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.surface,
                ),
                iconStyleData: IconStyleData(
                  iconEnabledColor: context.theme.colorScheme.surface,
                ),
                hint: Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: context.theme.colorScheme.surface,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        'select_city'.tr(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: context.theme.colorScheme.surface,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                buttonStyleData: ButtonStyleData(
                  // padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: context.theme.colorScheme.surface,
                    ),
                  ),
                  // elevation: 2,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: context.theme.colorScheme.primaryContainer,
                  ),
                  offset: const Offset(-20, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: WidgetStateProperty.all(6),
                    thumbVisibility: WidgetStateProperty.all(true),
                  ),
                ),
                items: items.map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                        ),
                      ),
                    )
                    .toList(),
                value: selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: (selectedValue != null) ?
      StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('courts')
            .where('location.city', isEqualTo: selectedValue)
            .snapshots(),
        builder: (context, snapshot) {
          List<QueryDocumentSnapshot<Object?>> courts = snapshot.data?.docs ?? [];
          if (courts.isNotEmpty) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.76,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8,
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data?.docs.length ?? 0,
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              itemBuilder: (context, index) {
                Map<String, dynamic> map = courts[index].data() as Map<String, dynamic>;
                CourtModel court = CourtModel.fromJson(map);
                return InkWell(
                  onTap: () => context.toView(BookingDetails(court: court)),
                  child: ClubCard(
                    city: court.location.state,
                    imageUrl: court.image,
                    name: court.name,
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('no_courts'.tr(),
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.theme.colorScheme.primary,
                ),
              ),
            );
          }
        },
      ) :
      StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('courts').snapshots(),
        builder: (context, snapshot) {
          List<QueryDocumentSnapshot<Object?>> courts = snapshot.data?.docs ?? [];
          if (courts.isNotEmpty) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.76,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8,
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data?.docs.length ?? 0,
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              itemBuilder: (context, index) {
                Map<String, dynamic> map = courts[index].data() as Map<String, dynamic>;
                CourtModel court = CourtModel.fromJson(map);
                return InkWell(
                  onTap: () => context.toView(BookingDetails(court: court)),
                  child: ClubCard(
                    city: court.location.state,
                    imageUrl: court.image,
                    name: court.name,
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}
