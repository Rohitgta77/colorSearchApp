class NetworkConstants {
  static Uri getColorSearchUrl(String keyword) {
    return Uri.parse(
        "https://www.colourlovers.com/api/colors?keywords=$keyword&format=json&numResults=20");
  }
}
