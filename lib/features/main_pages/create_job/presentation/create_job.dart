import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs_app/core/Widgets/drop_down.dart';
import 'package:jobs_app/core/themes/app_colors.dart';
import 'package:jobs_app/core/widgets/button.dart';
import 'package:jobs_app/core/widgets/screen_size.dart';
import 'package:jobs_app/core/widgets/spacing_size.dart';
import 'package:jobs_app/core/widgets/text.dart';
import 'package:jobs_app/core/widgets/text_field.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class CreateJob extends HookConsumerWidget {
  const CreateJob({super.key});
  static const int maxImages = 5;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> serviceTypes = [
      'Select service type',
      'AC Repair',
      'AC Installation',
      'Plumbing',
      'Electrical',
      'Refrigerator Repair',
      'Washing Machine Repair',
      'Microwave Repair',
      'Other',
    ];
    final selectedServiceType = useState<String?>(null);

    final customerName = useTextEditingController();
    final mobileNumber = useTextEditingController();

    final address = useTextEditingController();

    final dateTimeController = useTextEditingController();

    final notes = useTextEditingController();
    final images = useState<List<File>>([]);
    final picker = useMemoized(() => ImagePicker());
    Future<void> pickImages() async {
      if (images.value.length >= maxImages) return;

      final picked = await picker.pickMultiImage();
      if (picked.isEmpty) return;

      final remaining = maxImages - images.value.length;

      images.value = [
        ...images.value,
        ...picked.take(remaining).map((e) => File(e.path)),
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Job", style: AppTextStyles.body(context)),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.w16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fields(
                title: "Customer Name *",
                dataEntry: AppTextField(
                  controller: customerName,
                  hint: "Enter Customer Name",
                  prefix: Icon(Icons.person, color: AppColors.grey),
                ),
                context: context,
              ),
              SizedBox(height: AppSpacing.h16),
              fields(
                title: "Mobile Number *",
                dataEntry: AppTextField(
                  controller: mobileNumber,
                  hint: "Enter 10-digit Mobile Number",
                  type: TextInputType.number,
                  prefix: Icon(Icons.phone, color: AppColors.grey),
                ),
                context: context,
              ),
              SizedBox(height: AppSpacing.h16),
              fields(
                title: "Service Type *",
                dataEntry: AppDropDown(
                  label: "Select Service Type",
                  items: serviceTypes,
                  value: selectedServiceType.value,
                  onChanged: (value) {
                    selectedServiceType.value = value;
                  },
                ),
                context: context,
              ),

              SizedBox(height: AppSpacing.h16),
              fields(
                title: "Address *",
                dataEntry: AppTextField(
                  controller: address,
                  hint: "Enter complete address",
                  minlines: 3,

                  prefix: Icon(
                    Icons.location_on_rounded,
                    color: AppColors.grey,
                  ),
                ),
                context: context,
              ),
              SizedBox(height: AppSpacing.h16),
              fields(
                title: "Preferred Time ",
                dataEntry: AppTextField(
                  controller: dateTimeController,
                  readonly: true,
                  hint: "Preferred time",
                  onTap: () {
                    pickDateTime(
                      context: context,
                      controller: dateTimeController,
                    );
                  },
                  prefix: Icon(Icons.calendar_today, color: AppColors.grey),
                ),
                context: context,
              ),
              SizedBox(height: AppSpacing.h16),
              fields(
                title: "Notes",
                dataEntry: AppTextField(
                  controller: notes,
                  hint: "Any additional information",
                  minlines: 3,
                ),
                context: context,
              ),
              SizedBox(height: AppSpacing.h16),
              fields(
                title: "Images",
                dataEntry: Wrap(
                  spacing: AppSpacing.w8,
                  runSpacing: AppSpacing.w4,
                  children: [
                    for (var i in images.value) ...[imageContainer(img: i)],
                    pickImageWidget(pickImages),
                  ],
                ),
                context: context,
              ),
              SizedBox(height: AppSpacing.h24),
              AppButton(
                text: "Create Job",
                onTap: () {},
                buttonColor: AppColors.orangetheme,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickDateTime({
    required BuildContext context,
    required TextEditingController controller,
  }) async {
    final DateTime? result = await showOmniDateTimePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      is24HourMode: false,
      isShowSeconds: false,
      minutesInterval: 1,
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      type: OmniDateTimePickerType.dateAndTime,
      title: const Text('Select Date & Time'),
      theme: ThemeData.light(),
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
    );

    if (result == null) return;

    controller.text = formatDateTime(result);
  }

  String formatDateTime(DateTime dateTime) {
    return "${dateTime.day.toString().padLeft(2, '0')}/"
        "${dateTime.month.toString().padLeft(2, '0')}/"
        "${dateTime.year}  "
        "${_formatHour(dateTime)}";
  }

  String _formatHour(DateTime dt) {
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final minute = dt.minute.toString().padLeft(2, '0');
    final period = dt.hour >= 12 ? 'PM' : 'AM';
    return "$hour:$minute $period";
  }

  Widget fields({
    required String title,
    required Widget dataEntry,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.body(context)),
        SizedBox(height: AppSpacing.h8),
        dataEntry,
      ],
    );
  }

  Widget pickImageWidget(Future<void> Function() pickImages) {
    return DottedBorder(
      options: RectDottedBorderOptions(
        dashPattern: [10, 5],
        strokeWidth: 2,
        padding: EdgeInsets.all(16),
      ),
      child: GestureDetector(
        onTap: pickImages,
        child: Container(
          height: AppSize.height * 0.1,
          width: AppSize.height * 0.1,
          alignment: Alignment.center,
          child: const Icon(
            Icons.camera_alt_outlined,
            color: Colors.grey,
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget imageContainer({required File img}) {
    return SizedBox(
      height: AppSize.height * 0.1,
      width: AppSize.height * 0.1,
      child: Image.file(img, fit: BoxFit.cover),
    );
  }
}

// class CreateJob extends StatefulWidget {
//   const CreateJob({super.key});

//   @override
//   State<CreateJob> createState() => _CreateJobState();
// }

// class _CreateJobState extends State<CreateJob> {
//   final List<String> serviceTypes = [
//     'Select service type',
//     'AC Repair',
//     'AC Installation',
//     'Plumbing',
//     'Electrical',
//     'Refrigerator Repair',
//     'Washing Machine Repair',
//     'Microwave Repair',
//     'Other',
//   ];

//   TextEditingController customerName = TextEditingController();
//   TextEditingController mobileNumber = TextEditingController();
//   TextEditingController address = TextEditingController();
//   final TextEditingController dateTimeController = TextEditingController();
//   TextEditingController notes = TextEditingController();
//   String? selectedServiceType;
//   DateTime? selectedDateTime;
//   final ImagePicker _picker = ImagePicker();
//   final List<File> _images = [];
//   static const int maxImages = 5;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Create Job", style: AppTextStyles.body(context)),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(AppSpacing.w16),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               fields(
//                 title: "Customer Name *",
//                 dataEntry: AppTextField(
//                   controller: customerName,
//                   hint: "Enter Customer Name",
//                   prefix: Icon(Icons.person, color: AppColors.grey),
//                 ),
//               ),
//               SizedBox(height: AppSpacing.h16),
//               fields(
//                 title: "Mobile Number *",
//                 dataEntry: AppTextField(
//                   controller: mobileNumber,
//                   hint: "Enter 10-digit Mobile Number",
//                   type: TextInputType.number,
//                   prefix: Icon(Icons.phone, color: AppColors.grey),
//                 ),
//               ),
//               SizedBox(height: AppSpacing.h16),
//               fields(
//                 title: "Service Type *",
//                 dataEntry: AppDropDown(
//                   label: "Select Service Type",
//                   items: serviceTypes,
//                   value: selectedServiceType,
//                   onChanged: (value) {
//                     setState(() {
//                       selectedServiceType = value;
//                     });
//                   },
//                 ),
//               ),

//               SizedBox(height: AppSpacing.h16),
//               fields(
//                 title: "Address *",
//                 dataEntry: AppTextField(
//                   controller: mobileNumber,
//                   hint: "Enter complete address",
//                   minlines: 3,

//                   prefix: Icon(
//                     Icons.location_on_rounded,
//                     color: AppColors.grey,
//                   ),
//                 ),
//               ),
//               SizedBox(height: AppSpacing.h16),
//               fields(
//                 title: "Preferred Time ",
//                 dataEntry: AppTextField(
//                   controller: dateTimeController,
//                   readonly: true,
//                   hint: "Preferred time",
//                   onTap: () {
//                     pickDateTime(context);
//                   },
//                   prefix: Icon(Icons.calendar_today, color: AppColors.grey),
//                 ),
//               ),
//               SizedBox(height: AppSpacing.h16),
//               fields(
//                 title: "Notes",
//                 dataEntry: AppTextField(
//                   controller: mobileNumber,
//                   hint: "Any additional information",
//                   minlines: 3,
//                 ),
//               ),
//               SizedBox(height: AppSpacing.h16),
//               fields(
//                 title: "Images",
//                 dataEntry: Wrap(
//                   spacing: AppSpacing.w8,
//                   runSpacing: AppSpacing.w4,
//                   children: [
//                     for (var i in _images) ...[imageContainer(img: i)],
//                     pickImageWidget(),
//                   ],
//                 ),
//               ),
//               SizedBox(height: AppSpacing.h24),
//               AppButton(
//                 text: "Create Job",
//                 onTap: () {},
//                 buttonColor: AppColors.orangetheme,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> pickDateTime(BuildContext context) async {
//     final DateTime? result = await showOmniDateTimePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(const Duration(days: 365)),
//       is24HourMode: false,
//       isShowSeconds: false,
//       minutesInterval: 1,
//       borderRadius: const BorderRadius.all(Radius.circular(16)),
//       type: OmniDateTimePickerType.dateAndTime,
//       title: const Text('Select Date & Time'),
//       theme: ThemeData.light(),
//       transitionDuration: const Duration(milliseconds: 200),
//       barrierDismissible: true,
//     );

//     if (result == null) return;

//     selectedDateTime = result;

//     dateTimeController.text = formatDateTime(result);
//   }

//   String formatDateTime(DateTime dateTime) {
//     return "${dateTime.day.toString().padLeft(2, '0')}/"
//         "${dateTime.month.toString().padLeft(2, '0')}/"
//         "${dateTime.year}  "
//         "${_formatHour(dateTime)}";
//   }

//   String _formatHour(DateTime dt) {
//     final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
//     final minute = dt.minute.toString().padLeft(2, '0');
//     final period = dt.hour >= 12 ? 'PM' : 'AM';
//     return "$hour:$minute $period";
//   }

//   Future<void> pickImages() async {
//     if (_images.length >= maxImages) return;

//     final List<XFile> pickedFiles = await _picker.pickMultiImage();

//     if (pickedFiles.isEmpty) return;

//     final remainingSlots = maxImages - _images.length;

//     final filesToAdd = pickedFiles.take(remainingSlots);

//     setState(() {
//       _images.addAll(filesToAdd.map((x) => File(x.path)));
//     });
//   }

//   Widget fields({required String title, required Widget dataEntry}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: AppTextStyles.body(context)),
//         SizedBox(height: AppSpacing.h8),
//         dataEntry,
//       ],
//     );
//   }

//   Widget pickImageWidget() {
//     return DottedBorder(
//       options: RectDottedBorderOptions(
//         dashPattern: [10, 5],
//         strokeWidth: 2,
//         padding: EdgeInsets.all(16),
//       ),
//       child: GestureDetector(
//         onTap: () {
//           pickImages();
//         },
//         child: Container(
//           height: AppSize.height * 0.1,
//           width: AppSize.height * 0.1,
//           alignment: Alignment.center,
//           child: const Icon(
//             Icons.camera_alt_outlined,
//             color: Colors.grey,
//             size: 30,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget imageContainer({required File img}) {
//     return SizedBox(
//       height: AppSize.height * 0.1,
//       width: AppSize.height * 0.1,
//       child: Image.file(img, fit: BoxFit.cover),
//     );
//   }
// }
