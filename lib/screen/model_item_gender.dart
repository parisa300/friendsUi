

class ModelItemGender {

  final String title;

  ModelItemGender({ required this.title});

}

class GenderProvider {
  List<ModelItemGender> getDepositList() {

    return [
      ModelItemGender(

          title: "Male"
      ),
      ModelItemGender(

        title: "Female",
      ),
      ModelItemGender(

        title: "Random",
      ),

    ];
  }
}