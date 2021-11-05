class SliderModel {
  String _imagePath;
  String _title;
  String _description;

  SliderModel({String imagePath, String title, String description}) {
    this._imagePath = imagePath;
    this._title = title;
    this._description = title;
  }

  String get description => _description;

  setdescription(String value) {
    _description = value;
  }

  String get title => _title;

  settitle(String value) {
    _title = value;
  }

  String get imagePath => _imagePath;

  setimagePath(String value) {
    _imagePath = value;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];

  SliderModel sliderModel = new SliderModel();
  sliderModel.settitle("Welcome to Classage");
  sliderModel.setimagePath("assets/eduon.jpg");
  sliderModel.setdescription(
      "An online virtual classroom platform for teachers and students");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.settitle("Video conference");
  sliderModel.setimagePath("assets/onlinelearning.png");
  sliderModel.setdescription(
      "get the real classroom feel with video conferencing and many more features");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.settitle("chat and share notes");
  sliderModel.setimagePath("assets/girlstudy.jpg");
  sliderModel.setdescription(
      "chat with your teachers or classmates no need to open another app");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  return slides;
}
