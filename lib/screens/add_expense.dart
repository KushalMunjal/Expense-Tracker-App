import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddScreen extends StatelessWidget {
  final TextEditingController amountCntrl = TextEditingController();
  String category = "Food";
  String paymentType = "Cash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFb6d8ae),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(10, 14, 10, 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide(color: Colors.grey[300]!, width: 1.5),
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.grey,
                      size: 32,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                  Text(
                    "Add transaction",
                    style: TextStyle(fontSize: 24, color: Colors.grey[800]),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[100],
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                      child: TextField(
                        controller: amountCntrl,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,}'),
                            replacementString: "",
                          ),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            "Amount",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          alignLabelWithHint: false,
                          prefixText: "₹",
                          prefixStyle:
                              TextStyle(color: Colors.grey[800], fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[100],
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Category",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          const SizedBox(height: 10),
                          DropdownButton(
                            value: category,
                            items: [
                              dropDownCard(
                                Icons.emoji_food_beverage_outlined,
                                "Food",
                                const Color(0xFFfaedd4),
                              ),
                              dropDownCard(
                                Icons.currency_rupee,
                                "Salary",
                                const Color(0xFFe9f3e6),
                              ),
                              dropDownCard(
                                Icons.local_movies_outlined,
                                "Entertainment",
                                const Color(0xFFf1e6ff),
                              ),
                            ],
                            icon: const Icon(Icons.keyboard_arrow_down),
                            isExpanded: true,
                            underline: const SizedBox(),
                            onChanged: (value) {
                              category = value!;
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Payment Type",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        radioButtonCard("Cash", 130),
                        radioButtonCard("Credit/Debit Card", 220),
                        radioButtonCard("Cheque", 140),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Draft",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800]),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // Handle button click
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFFb6d8ae),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Add",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800]),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem dropDownCard(IconData icon, String label, Color backColor) {
    return DropdownMenuItem(
      value: label,
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: backColor,
            ),
            child: Icon(
              icon,
              color: Colors.grey[800],
              size: 20,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            label,
            style: TextStyle(
                fontSize: 18,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget radioButtonCard(String label, double width) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: paymentType == label ? const Color(0xFFb6d8ae) : Colors.grey,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      width: width,
      margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
      child: RadioListTile<String>(
        title: Text(
          label,
          style: TextStyle(
              color: paymentType == label ? Colors.grey[800] : Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        value: label,
        groupValue: paymentType,
        activeColor: const Color(0xFFb6d8ae),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        onChanged: (value) {
          paymentType = value!;
        },
      ),
    );
  }
}
