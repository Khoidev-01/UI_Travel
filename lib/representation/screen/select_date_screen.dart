import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel/Core/Constants/dimension_constants.dart';
import 'package:travel/representation/widgets/app_bar_container.dart';
import 'package:travel/representation/widgets/button_widgets.dart';
import '../../Core/Constants/color_constants.dart';

// ignore: must_be_immutable
class SelectDateScreen extends StatelessWidget {
  SelectDateScreen({super.key});

  static const String routeName = '/select_date_screen';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Select date',
      paddingContent: const EdgeInsets.all(kMediumPadding),
      child: Column(
        children: [
          const SizedBox(
            height: kMediumPadding * 2,
          ),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings: const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: Colors.blue,
            startRangeSelectionColor: Colors.green,
            endRangeSelectionColor: Colors.orange,
            rangeSelectionColor: Colors.blue.withOpacity(0.25),
            todayHighlightColor: Colors.red,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              }
            },
          ),
          const SizedBox(
            height: kDefaultPadding * 2,
          ),
          ButtonWidget(
            title: 'Select',
            ontap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Cancel',
            color: ColorPalette.primaryColor.withOpacity(0.1),
            ontap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
        ],
      ),
    );
  }
}
