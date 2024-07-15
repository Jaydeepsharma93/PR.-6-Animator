class Planets {
  String? n, img, desc;
  var o, d_km, m_kg, mns, op_d, temp_c;
  bool? fav;

  Planets(
      {this.n,
      this.img,
      this.desc,
      this.d_km,
      this.m_kg,
      this.mns,
      this.o,
      this.op_d,
      this.temp_c,
      this.fav});

  factory Planets.fromJson(Map json) {
    return Planets(
        d_km: json["d_km"],
        desc: json["desc"],
        img: json["img"],
        m_kg: json["m_kg"],
        mns: json["mns"],
        n: json["n"],
        o: json["o"],
        op_d: json["op_d"],
        temp_c: json["temp_c"],
        fav: json["fav"]);
  }
}
