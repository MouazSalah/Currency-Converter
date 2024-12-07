import 'package:contactcars_app_retail/db/api/url_provider.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

enum ImageSize { Large, Small, Original, XSmall }

String getFullImageURL(
  String url, {
  ImageSize size = ImageSize.Small,
  bool isProfileIcon = false,
  bool assets = false,
}) {
  final baseUrl = UrlProvider.config.baseImageUrl;

  if (url.contains("https://") || url.contains("http://")) {
    return url.toString().trim();
  } else if (assets) {
    return "$baseUrl/Assets/${url.toString().trim()}";
  } else if (isProfileIcon == true) {
    return "$baseUrl/Images/Profile/${url.toString().trim()}";
  } else {
    switch (size) {
      case ImageSize.Large:
        return "$baseUrl/Images/Large/${url.toString().trim()}";
      case ImageSize.Small:
        return "$baseUrl/Images/Small/${url.toString().trim()}";
      case ImageSize.Original:
        return "$baseUrl/Images/Original/${url.toString().trim()}";
      case ImageSize.XSmall:
        return "$baseUrl/Images/XSmall/${url.toString().trim()}";
      default:
        return "$baseUrl${url.toString().trim()}";
    }
  }
}

Future<XFile?> compressImage(XFile file) async {
  final filePath = file.path; // XFile has a .path getter directly
  // Create output file path
  // e.g., /path/image.jpg becomes /path/image_compressed.jpg
  final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
  final splitted = filePath.substring(0, lastIndex);
  final outPath = "${splitted}_compressed.jpg";
  var result = await FlutterImageCompress.compressAndGetFile(
    filePath,
    outPath,
    quality: 50, // You can adjust the quality parameter as needed
  );

  return result;
}
