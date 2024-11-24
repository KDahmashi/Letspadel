import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:padel/core/usecases/constants.dart';
import 'package:flutter/material.dart';
import '../models/court_model.dart';
import 'booking_details.dart';
import 'club_card.dart';


class YourClubs extends StatelessWidget {
  const YourClubs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: Text(
            'most_booked'.tr(),
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: context.screenSize.width,
          height: 225,
          child: StreamBuilder<QuerySnapshot>(
            stream: firestore.collection('courts').snapshots(),
            builder: (context, snapshot) {
              List<QueryDocumentSnapshot<Object?>> courts = snapshot.data?.docs ?? [];
              if (courts.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.docs.length ?? 0,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  itemBuilder: (context, index) {
                    Map<String, dynamic> map = courts[index].data() as Map<String, dynamic>;
                    CourtModel court = CourtModel.fromJson(map);
                    return InkWell(
                      onTap: () => context.toView(BookingDetails(court: court)),
                      child: ClubCard(
                        imageUrl: court.image,
                        name: court.name,
                        city: court.location.state,
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
          ),
          /*
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 16,),

              //! Club 1
              ClubCard(
                imageUrl: Assets.imagesClub1,
                name: 'padel_arena'.tr(),
                city: 'riyadh'.tr(),
              ),


              //! Club 2
              ClubCard(
                imageUrl: Assets.imagesClub2,
                name: 'padel_arena'.tr(),
                city: 'riyadh'.tr(),
              ),

              //! Club 3
              ClubCard(
                imageUrl: Assets.imagesClub3,
                name: 'padel_arena'.tr(),
                city: 'riyadh'.tr(),
              ),

              //! Club 4
              ClubCard(
                imageUrl: Assets.imagesClub4,
                name: 'padel_arena'.tr(),
                city: 'riyadh'.tr(),
              ),

              const SizedBox(width: 16,),
            ],
          ),
          */
        ),
      ],
    );
  }
}
