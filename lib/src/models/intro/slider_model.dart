class SliderModel {
  String? image;
  String? title;
  String? description;

// Constructor for variables
  SliderModel({this.title, this.description, this.image});

  void setImage(String getImage) {
    image = getImage;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String? getImage() {
    return image;
  }

  String? getTitle() {
    return title;
  }

  String? getDescription() {
    return description;
  }
}

// List created
List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = SliderModel();

// Item 1
  sliderModel.setImage("assets/images/intro1.png");
  sliderModel.setTitle("Welcome to Skipper 11");
  sliderModel.setDescription(
      "Ready to start winning? Swipe left to Learn the basics of fantasy sports.");
  slides.add(sliderModel);

  sliderModel = SliderModel();

// Item 2
  sliderModel.setImage("assets/images/intro2.png");
  sliderModel.setTitle("Select A Match");
  sliderModel.setDescription("Choose an upcoming match that you Want to play.");
  slides.add(sliderModel);

  sliderModel = SliderModel();

// Item 3
  sliderModel.setImage("assets/images/intro3.png");
  sliderModel.setTitle("Join Contests");
  sliderModel
      .setDescription("Compete with other Skipper 11 players for big rewards.");
  slides.add(sliderModel);

  sliderModel.setImage("assets/images/intro4.png");
  sliderModel.setTitle("Create Teams");
  sliderModel.setDescription(
      "Use your skills to pick the right players and earn fantasy points.");
  slides.add(sliderModel);

  sliderModel = SliderModel();
  return slides;
}
