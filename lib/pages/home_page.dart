import 'package:cookbook_examples/models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:cookbook_examples/pages/add_account.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
    required this.accountInfo,
  }) : super(key: key);
  var accountInfo;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var account = {};
  List<String> items = new List.generate(10, (index) => "Balance $index");

  List<String> bankAccounts = [
    "Paypal",
    "Enpara",
    "Paribu",
    "Binance",
    "Ziraat",
    "Garanti",
    "",
  ];
  List<AccountModel> accountList = List<AccountModel>.empty(growable: true);
  List<double> Quantity = [8850, 1300, 1.2, 1.3, 400, 220, 5];

  List<double> convertRatio = [10, 1, 2];

  double sum = 0;

  /* Return Data Functions */

  // @override
  // void initState() {
  //   while (widget.accountInfo != null && widget.accountInfo != "") {
  //     updateList();
  //   }
  // }

  // void updateList() {
  //   setState(() {
  //     bankAccounts.add(widget.accountInfo["accountName"]);
  //     Quantity.add(double.parse(widget.accountInfo["quantity"]));
  //     widget.accountInfo = "";
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final accountListData = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddAccountPage(accountList: accountList)),
          );
          setState(() {
            accountList = accountListData;
          });
        },
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.add),
        ),
        elevation: 4.0,
      ),
      appBar: AppBar(
        title: Center(
            child: Text(
          "iSavings",
          style: Theme.of(context).textTheme.headline2,
        )),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                splashRadius: 100,
                onPressed: () {},
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                splashRadius: 100,
                onPressed: () {},
                iconSize: 27.0,
                icon: Icon(
                  Icons.account_balance,
                ),
              ),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
      ),
      endDrawer: Drawer(
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) => Container(
            child: ListTile(
              onTap: () {},
              title: Text("Settings"),
            ),
            height: 50,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            child: _accountCards(context),
          ),
          _balanceCard(context),
          Text(accountList.length.toString()),
        ],
      ),
    );
  }

  Widget _balanceCard(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "TOTAL",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  (() {
                    {
                      if (accountList.isNotEmpty)
                        for (var i = accountList.length - 1;
                            i < accountList.length;
                            i++) {
                          sum += accountList[i].money.toDouble();
                        }
                      return "" + sum.toString();
                    }
                  })(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textScaleFactor: 1.2,
                ),
              ),
            ],
          ),
          height: 120,
          width: 200,
        ),
      ),
    );
  }

  Widget _accountCards(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: accountList.length,
      itemBuilder: (BuildContext context, int index) => Container(
        width: 150,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Card(
            child: ListTile(
              onTap: () {},
              minLeadingWidth: 25,
              leading: Align(
                  alignment: Alignment.bottomLeft,
                  widthFactor: .5,
                  child: Icon(
                    Icons.monetization_on,
                  )),
              title: Padding(
                padding: const EdgeInsets.only(top: 20, left: 5),
                child: Text(
                  accountList[index].name,
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "\$" + accountList[index].money.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
