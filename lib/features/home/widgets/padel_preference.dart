import 'package:easy_localization/easy_localization.dart';
import 'package:padel/core/extensions/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:choice/choice.dart';


class PadelPreference extends StatefulWidget {
  const PadelPreference({super.key});

  @override
  State<PadelPreference> createState() => _PadelPreferenceState();
}

class _PadelPreferenceState extends State<PadelPreference> {

  //! Best Hand
  String? selectedBestHand;
  final List<String> bestHandChoices = [
    'right_handed'.tr(),
    'left_handed'.tr(),
    'both_hands'.tr(),
  ];
  void setHandSelectedValue(String? value) {
    setState(() => selectedBestHand = value);
  }


  //! Court side
  String? selectedCourtSide;
  final List<String> courtSideChoices = [
    'backhand'.tr(),
    'forehand'.tr(),
    'both_sides'.tr(),
  ];
  void setCourtSelectedValue(String? value) {
    setState(() => selectedCourtSide = value);
  }


  //! Match type
  String? selectedMatchType;
  final List<String> courtMatchChoices = [
    'competitive'.tr(),
    'friendly'.tr(),
    'both'.tr(),
  ];
  void setMatchSelectedValue(String? value) {
    setState(() => selectedMatchType = value);
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          //! Best Hand
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'best_hand_title'.tr(),
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Choice<String>.inline(
            clearable: true,
            value: ChoiceSingle.value(selectedBestHand),
            onChanged: ChoiceSingle.onChanged(setHandSelectedValue),
            itemCount: bestHandChoices.length,
            itemBuilder: (state, i) {
              return ChoiceChip(
                shape: state.selected(bestHandChoices[i]) ?
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: context.theme.colorScheme.primary,
                    width: 1,
                  ),
                ) : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: context.theme.colorScheme.onPrimary,
                    width: 1,
                  ),
                ),
                selected: state.selected(bestHandChoices[i]),
                onSelected: state.onSelected(bestHandChoices[i]),
                selectedShadowColor: context.theme.colorScheme.primary,
                surfaceTintColor: context.theme.colorScheme.primary,
                checkmarkColor: context.theme.colorScheme.primary,
                shadowColor: context.theme.colorScheme.primary,
                selectedColor: context.theme.primaryColor,
                // backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  color: context.theme.colorScheme.primary,
                ),
                color: WidgetStatePropertyAll<Color>(
                  context.theme.colorScheme.surface,
                ),
                label: Text(
                  bestHandChoices[i],
                  style: context.textTheme.labelSmall?.copyWith(
                    fontWeight: state.selected(bestHandChoices[i]) ?
                    FontWeight.w500 : FontWeight.w200,
                    color: context.theme.colorScheme.primary,
                    // fontSize: 14,
                  ),
                ),
              );
            },
            listBuilder: ChoiceList.createScrollable(
              spacing: 10,
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 6,
              ),
            ),
          ),

          const SizedBox(height: 25),

          //! Court side
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'best_hand_title'.tr(),
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Choice<String>.inline(
            clearable: true,
            value: ChoiceSingle.value(selectedCourtSide),
            onChanged: ChoiceSingle.onChanged(setCourtSelectedValue),
            itemCount: courtSideChoices.length,
            itemBuilder: (state, i) {
              return ChoiceChip(
                shape: state.selected(courtSideChoices[i]) ?
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: context.theme.colorScheme.primary,
                    width: 1,
                  ),
                ) : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: context.theme.colorScheme.onPrimary,
                    width: 1,
                  ),
                ),
                selected: state.selected(courtSideChoices[i]),
                onSelected: state.onSelected(courtSideChoices[i]),
                selectedShadowColor: context.theme.colorScheme.primary,
                surfaceTintColor: context.theme.colorScheme.primary,
                checkmarkColor: context.theme.colorScheme.primary,
                shadowColor: context.theme.colorScheme.primary,
                selectedColor: context.theme.primaryColor,
                // backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  color: context.theme.colorScheme.primary,
                ),
                color: WidgetStatePropertyAll<Color>(
                  context.theme.colorScheme.surface,
                ),
                label: Text(
                  courtSideChoices[i],
                  style: context.textTheme.labelSmall?.copyWith(
                    fontWeight: state.selected(courtSideChoices[i]) ?
                    FontWeight.w500 : FontWeight.w200,
                    color: context.theme.colorScheme.primary,
                    // fontSize: 14,
                  ),
                ),
              );
            },
            listBuilder: ChoiceList.createScrollable(
              spacing: 10,
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 6,
              ),
            ),
          ),

          const SizedBox(height: 25),

          //! Match type
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'best_hand_title'.tr(),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'the_result_of_match'.tr(),
                  style: context.textTheme.labelSmall?.copyWith(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w100,
                  ),
                ),

              ],
            ),
          ),
          Choice<String>.inline(
            clearable: true,
            value: ChoiceSingle.value(selectedMatchType),
            onChanged: ChoiceSingle.onChanged(setMatchSelectedValue),
            itemCount: courtMatchChoices.length,
            itemBuilder: (state, i) {
              return ChoiceChip(
                shape: state.selected(courtMatchChoices[i]) ?
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: context.theme.colorScheme.primary,
                    width: 1,
                  ),
                ) : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: context.theme.colorScheme.onPrimary,
                    width: 1,
                  ),
                ),
                selected: state.selected(courtMatchChoices[i]),
                onSelected: state.onSelected(courtMatchChoices[i]),
                selectedShadowColor: context.theme.colorScheme.primary,
                surfaceTintColor: context.theme.colorScheme.primary,
                checkmarkColor: context.theme.colorScheme.primary,
                shadowColor: context.theme.colorScheme.primary,
                selectedColor: context.theme.primaryColor,
                // backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  color: context.theme.colorScheme.primary,
                ),
                color: WidgetStatePropertyAll<Color>(
                  context.theme.colorScheme.surface,
                ),
                label: Text(
                  courtMatchChoices[i],
                  style: context.textTheme.labelSmall?.copyWith(
                    fontWeight: state.selected(courtMatchChoices[i]) ?
                    FontWeight.w500 : FontWeight.w200,
                    color: context.theme.colorScheme.primary,
                    // fontSize: 14,
                  ),
                ),
              );
            },
            listBuilder: ChoiceList.createScrollable(
              spacing: 10,
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 6,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
