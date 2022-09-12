class FlowLocation {
  String id;
  String name;
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
    required this.name,
    this.distance,
    required this.isflowing,
    required this.type,
    required this.lat,
    required this.long,
    // this.savedisSaved,
  });

  ///convert from map to flowSaved object
  FlowLocation.fromMap(Map map)
      : id = map[
            'id'], // assigning ths SavedID from the constructor to the 'ID' property/Variable of our map
        description = map['description'],
        name = map['name'],
        distance = map['distance'],
        isflowing = map['isFlowing'],
        type = map['type'],
        lat = map['lat'],
        long = map['long'];
  //  this.savedisSaved = map['isSaved'];

  ///convert from flowSaved Object to a map
  Map toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'distance': distance,
      'flowing': isflowing,
      'type': type,
      'lat': lat,
      'long': long,
      // 'isSaved': this.savedisSaved,
    };
  }
}
