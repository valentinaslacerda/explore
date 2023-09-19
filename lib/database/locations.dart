const GOOGLE_API_KEY = 'AIzaSyAhbkuL8LXvk8MhwfW9N-HPhNGgjYW6aSI';

class Locations{
  static String generateLocationPreview({
    double? latitude,
    double? longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=400x400&key=$GOOGLE_API_KEY';
  }
}