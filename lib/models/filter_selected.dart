class FilterSelected {
  String type;
  String param;

  FilterSelected({this.type, this.param});

  FilterSelected.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    param = json['param'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['param'] = this.param;
    return data;
  }
}
