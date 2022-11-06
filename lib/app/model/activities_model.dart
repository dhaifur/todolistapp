// ignore_for_file: public_member_api_docs, sort_constructors_first
class Activity {
  int? id;
  String? title;
  String? description;
  String? date;
  String? time;

  Activity({
    this.id,
    this.title,
    this.description,
    this.date,
    this.time,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        date: json["date"],
        time: json["time"]
      );
}
