class DocumentPath {
  static String productcheckout(String uid, String productId) =>
      'Buyers/$uid/checkouts/$productId';
  static String checkout(String uid) => 'Buyers/$uid/checkouts/';

  static String newproduct(String newproductId) => 'Apliances/$newproductId';
  static String streamproduct() => 'Apliances/';

  static String newAllSpices(String newAllSpicesId) =>
      'All Spices/$newAllSpicesId';
  static String streamAllSpices() => 'All Spices/';

  static String newComputer(String newComputerId) => 'Computers/$newComputerId';
  static String streamComputer() => 'Computers/';

  static String newPhones(String newPhonesId) =>
      'phones and acessories/$newPhonesId';
  static String streamPhones() => 'phones and acessories/';
}
