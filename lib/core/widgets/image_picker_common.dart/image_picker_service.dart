import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AppImagePicker {
  static final ImagePicker _picker = ImagePicker();

  /// Pick images
  /// [multiple] → true = gallery multi-select
  /// [maxImages] → ignored if multiple = false
  static Future<List<File>> pick({
    required ImageSource source,
    bool multiple = true,
    int maxImages = 5,
  }) async {
    if (source == ImageSource.camera) {
      final XFile? picked = await _picker.pickImage(source: ImageSource.camera);
      if (picked == null) return [];
      return [File(picked.path)];
    }

    // Gallery
    if (multiple) {
      final List<XFile> picked = await _picker.pickMultiImage();
      return picked.take(maxImages).map((e) => File(e.path)).toList();
    } else {
      final XFile? picked = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (picked == null) return [];
      return [File(picked.path)];
    }
  }
}
