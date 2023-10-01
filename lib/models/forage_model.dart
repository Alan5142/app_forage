class ForageModel {
  String name;
  String location;
  bool currentlyInSeason;
  String notes;

  ForageModel(
      {this.name = '',
      this.location = '',
      this.currentlyInSeason = false,
      this.notes = ''});
}
