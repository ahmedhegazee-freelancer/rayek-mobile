part of '../form.dart';


class _UploadFileForm extends StatefulWidget {
  const _UploadFileForm({Key? key}) : super(key: key);

  @override
  _UploadFileFormState createState() => _UploadFileFormState();
}

class _UploadFileFormState extends State<_UploadFileForm> {
  FilePickerResult? _pickedFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              Strings.consultationTopic.tr(),
              style: AppTextStyle.h1,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        CustomTextField(
          heightOfTextField: 150.h,
          hasPrefix: false,
          maxLines: 5,
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Text(
              Strings.uploadFile.tr(),
              style: AppTextStyle.h1,
            ),
            SizedBox(width: 5.w),
            Text(
              "(${Strings.ifFound.tr()})",
              style: AppTextStyle.h4Grey,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        CustomButton(
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'jpeg', 'png']);

            if(result != null) {
              setState(() {
                _pickedFile = result;
              });
            } else {
              // User canceled the picker
            }
          },
          text: Strings.download.tr(),
          isGap: false,
          iconData: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              IconManager.uploadImage,
              colorFilter: const ColorFilter.mode(ColorManager.whiteTextColor, BlendMode.srcIn),
              height: 20.h,
              width: 20.w,
            ),
          ),
        ),
        if (_pickedFile != null)
          Text('Picked File: ${_pickedFile!.files.single.name}'),
      ],
    );
  }
}