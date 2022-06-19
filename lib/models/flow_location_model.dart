class FlowLocation {
  String id;
  String description;
  String? distance;
  bool isflowing;
  String type;
  double lat;
  double long;
  //bool savedisSaved;

  FlowLocation({
   required  this.id,
    required this.description,
    this.distance,
    required this.isflowing,
    required this.type,
    required this.lat,
    required this.long,
    // this.savedisSaved,
  });

  ///convert from map to flowSaved object
  FlowLocation.fromMap(Map map)
      : this.id = map[
            'id'], // assigning ths SavedID from the constructor to the 'ID' property/Variable of our map
        this.description = map['description'],
        this.distance = map['distance'],
        this.isflowing = map['isFlowing'],
        this.type = map['type'],
        this.lat = map['lat'],
        this.long = map['long'];
  //  this.savedisSaved = map['isSaved'];

  ///convert from flowSaved Object to a map
  Map toMap() {
    return {
      'id': this.id,
      'description': this.description,
      'distance': this.distance,
      'flowing': this.isflowing,
      'type': this.type,
      'lat': this.lat,
      'long': this.long,
      // 'isSaved': this.savedisSaved,
    };
  }
}
