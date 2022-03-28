class Alert {
  String? headline;
  String? msgtype;
  String? severity;
  String? urgency;
  String? areas;
  String? category;
  String? certainty;
  String? event;
  String? note;
  String? effective;
  String? expires;
  String? desc;
  String? instruction;

  Alert(
      {this.headline,
        this.msgtype,
        this.severity,
        this.urgency,
        this.areas,
        this.category,
        this.certainty,
        this.event,
        this.note,
        this.effective,
        this.expires,
        this.desc,
        this.instruction});

  Alert.fromJson(Map<String, dynamic> json) {
    headline = json['headline'];
    msgtype = json['msgtype'];
    severity = json['severity'];
    urgency = json['urgency'];
    areas = json['areas'];
    category = json['category'];
    certainty = json['certainty'];
    event = json['event'];
    note = json['note'];
    effective = json['effective'];
    expires = json['expires'];
    desc = json['desc'];
    instruction = json['instruction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['headline'] = this.headline;
    data['msgtype'] = this.msgtype;
    data['severity'] = this.severity;
    data['urgency'] = this.urgency;
    data['areas'] = this.areas;
    data['category'] = this.category;
    data['certainty'] = this.certainty;
    data['event'] = this.event;
    data['note'] = this.note;
    data['effective'] = this.effective;
    data['expires'] = this.expires;
    data['desc'] = this.desc;
    data['instruction'] = this.instruction;
    return data;
  }
}