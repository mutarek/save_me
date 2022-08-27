class Note{
  int? id;
  String? bus_name;
  String? customer_name;
  String? seat;
  String? number;
  String? journey_date;
  String? booking_time;

  Note({this.id, this.bus_name, this.customer_name, this.seat,this.number, this.journey_date,
      this.booking_time});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map<String, dynamic>();
    if (id != null) {
      data['id'] = id;
    }
    data['bus_name'] = bus_name;
    data['customer_name'] = customer_name;
    data['seat'] = seat;
    data['number']= number;
    data['journey_date'] = journey_date;
    data['booking_time'] = booking_time;
    return data;
  }

  @override toString() {
    return {
      'id': id,
      'bus_name': bus_name,
      'customer_name': customer_name,
      'seat': seat,
      'number':number,
      'journey_date': journey_date,
      'booking_time': booking_time,
    }.toString();
  }

}