class AccountModel {
  String name;
  String type;
  String currency;
  int money;

  AccountModel(
      {required this.name,
      required this.type,
      required this.currency,
      required this.money}) {
    this.name = name;
    this.type = type;
    this.currency = currency;
    this.money = money;
  }
}
