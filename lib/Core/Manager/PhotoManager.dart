import 'package:images_picker/images_picker.dart';

class PhotoManager {
  Future<List<Media>?> pickImage({int imageCount = 1}) async {
    return await ImagesPicker.pick(
      count: imageCount,
      pickType: PickType.image,
      cropOpt: CropOption(
          aspectRatio: CropAspectRatio.custom, cropType: CropType.rect),
      quality: 0.8, // only for android
      maxSize: 500, // only for ios (kb)
    );
  }
}
