import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFb6d8ae),
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello,",
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            "David",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(32)),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      outlinedButton("All", () {
                        // Handle All button press
                      }),
                      outlinedButton("Daily", () {
                        // Handle Daily button press
                      }),
                      outlinedButton("Weekly", () {
                        // Handle Weekly button press
                      }),
                      outlinedButton("Monthly", () {
                        // Handle Monthly button press
                      }),
                      outlinedButton("Yearly", () {
                        // Handle Yearly button press
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[100],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 5,
                                height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: const Color(0xFFb6d8ae),
                                ),
                              ),
                              const Text(" Income"),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10, height: 35),
                              Text(
                                "₹1000.00", // Replace with actual income value
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                width: 5,
                                height: 15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: const Color(0xFFfeb9ab),
                                ),
                              ),
                              const Text(" Spent"),
                            ],
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10, height: 35),
                              Text(
                                "₹500.00", // Replace with actual spent value
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          // Put chart here
                          SizedBox(
                            width: 165,
                            height: 165,
                            child: charts.PieChart(
                              [
                                charts.Series<Expense, int>(
                                  id: 'Expense',
                                  domainFn: (Expense obj, _) => obj.label,
                                  measureFn: (Expense obj, _) => obj.value,
                                  data: [
                                    Expense(0,
                                        1000), // Replace with actual income value
                                    Expense(1,
                                        500), // Replace with actual spent value
                                  ],
                                  colorFn: (datum, index) => [
                                    charts.ColorUtil.fromDartColor(
                                        const Color(0xFFb6d8ae)),
                                    charts.ColorUtil.fromDartColor(
                                        const Color(0xFFfeb9ab)),
                                  ][index!],
                                ),
                              ],
                              animate: false,
                              defaultRenderer: charts.ArcRendererConfig<int>(
                                  arcWidth: 30, startAngle: 31.4),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Recent transactions",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        side: BorderSide(color: Colors.grey[300]!, width: 1.5),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        10, // Replace with the actual number of transactions
                    itemBuilder: (context, index) {
                      // Replace with actual transaction data
                      return expenseCard(
                        50.00,
                        "Food",
                        "Credit Card",
                        "2023-10-26",
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the floating action button press to navigate to the AddScreen
        },
        backgroundColor: const Color(0xFFb7d9ae),
        child: Icon(
          Icons.add,
          color: Colors.grey[800],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Add your bottom navigation bar here
    );
  }

  Widget outlinedButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          side: BorderSide(color: Colors.grey[300]!, width: 1.5),
        ),
        child: Text(
          label,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget expenseCard(
      double amount, String category, String paymentType, String timestamp) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: category == "Food"
                  ? const Color(0xFFfaedd4)
                  : category == "Salary"
                      ? const Color(0xFFe9f3e6)
                      : const Color(0xFFf1e6ff),
            ),
            child: Icon(
              category == "Food"
                  ? Icons.emoji_food_beverage_outlined
                  : category == "Salary"
                      ? Icons.currency_rupee
                      : Icons.local_movies_outlined,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        category,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "${category == "Salary" ? "" : "-"}₹${amount.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        paymentType,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      timestamp,
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Expense {
  final int label;
  final int value;

  Expense(this.label, this.value);
}
