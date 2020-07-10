class HeroData {
  int id;
  String nickname;
  String url;
  Map<String, dynamic> powerstats = {};
  Map<String, dynamic> appearance = {};
  Map<String, dynamic> biography = {};

  HeroData(
      {this.id,
      this.nickname,
      this.url,
      this.powerstats,
      this.appearance,
      this.biography});
}
