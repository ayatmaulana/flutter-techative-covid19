class Stats {
  String type;
  String name;
  int timestamp;
  Numbers numbers;
  List<Regions> regions;

  Stats({this.type, this.name, this.timestamp, this.numbers, this.regions});

  Stats.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    timestamp = json['timestamp'];
    numbers =
        json['numbers'] != null ? new Numbers.fromJson(json['numbers']) : null;
    if (json['regions'] != null) {
      regions = new List<Regions>();
      json['regions'].forEach((v) {
        regions.add(new Regions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    data['timestamp'] = this.timestamp;
    if (this.numbers != null) {
      data['numbers'] = this.numbers.toJson();
    }
    if (this.regions != null) {
      data['regions'] = this.regions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Numbers {
  int infected = 0;
  int recovered = 0;
  int fatal = 0;

  Numbers({this.infected, this.recovered, this.fatal});

  Numbers.fromJson(Map<String, dynamic> json) {
    infected = json['infected'];
    recovered = json['recovered'];
    fatal = json['fatal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['infected'] = this.infected;
    data['recovered'] = this.recovered;
    data['fatal'] = this.fatal;
    return data;
  }
}

class Regions {
  String type;
  String name;
  Numbers numbers;

  Regions({this.type, this.name, this.numbers});

  Regions.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    numbers =
        json['numbers'] != null ? new Numbers.fromJson(json['numbers']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    if (this.numbers != null) {
      data['numbers'] = this.numbers.toJson();
    }
    return data;
  }
}
