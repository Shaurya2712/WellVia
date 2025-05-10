import 'package:get/get.dart';

class BookConsultationController extends GetxController {
  // Days (Mon 21 to Sat 26)
  final days = [
    {'label': 'Mon', 'date': '21'},
    {'label': 'Tue', 'date': '22'},
    {'label': 'Wed', 'date': '23'},
    {'label': 'Thu', 'date': '24'},
    {'label': 'Fri', 'date': '25'},
    {'label': 'Sat', 'date': '26'},
  ];

  // Time slots
  final morningSlots = ['06:30 AM - 7:30 AM', '7:30 AM - 8:30 AM','08:30 AM - 09:30 AM', '09:30 AM - 10:30 AM', ];
  final afternoonSlots = ['01:30 PM - 02:30 PM'];
  final eveningSlots = ['07:30 PM - 8:30 PM', '08:30 PM - 09:30 PM'];

  var selectedDayIndex = 2.obs; // Default to Wed, 23
  var selectedTimeSlot = '06:30 AM - 7:30 AM'.obs; // Default to first morning slot

  void selectDay(int index) {
    print("select day = $index");
    selectedDayIndex.value = index;
  }

  void selectTimeSlot(String slot) {
    print("Slot = $slot");
    selectedTimeSlot.value = slot;
  }

  void bookAppointment() {
    final day = days[selectedDayIndex.value];
    final slot = selectedTimeSlot.value;
    print('Selected date: ${day['label']} ${day['date']}, Time slot: ${slot.isEmpty ? 'None' : slot}');
  }
}