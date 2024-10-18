class GPS {
  double latitude = 0.0;
  double longitude = 0.0;

  GPS(this.latitude, this.longitude);

  void setCoordinates(double latitude, double longitude) {
    this.latitude = latitude;
    this.longitude = longitude;
  }

  @override
  String toString() {
    return "($latitude, $longitude)";
  }

  Map<String, dynamic> toJSON() {
    return {
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory GPS.fromJSON(String json) {
    List<double> coordinates = json.split(',').map((coord) =>
        double.parse(coord.trim())).toList();
    return GPS(coordinates[0], coordinates[1]);
  }
}
