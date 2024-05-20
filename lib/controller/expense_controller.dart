import '/model/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class ExpenseController extends GetxController {
  String selected = "All";
  int curBottomNavIndex = 0;

  List<List<dynamic>> iconList = [
    [Icons.home, "Home"],
    [Icons.swap_horiz, "Transfer"],
    [Icons.account_balance_wallet_outlined, "Wallet"],
    [Icons.account_circle_outlined, "Profile"],
  ];

  double income = 0;
  double spent = 0;

  late List<ExpenseData> expenses;

  List<ExpenseData> retrieveData() {
    final box = GetStorage();
    final data = box.read('expenses');
    if (data != null && data is List) {
      return data.map((item) => ExpenseData.fromMap(item)).toList();
    } else {
      return [];
    }
  }

  String category = "Food";
  String paymentType = "Cash";

  TextEditingController amountCntrl = TextEditingController();

  final box = GetStorage();
  double amount = 0.0;

  void saveData() {
    final newExpense = ExpenseData(
      amount: double.tryParse(amountCntrl.text) ?? 0,
      category: category,
      paymentType: paymentType,
      timestamp: DateFormat('MMM dd, yyyy').format(DateTime.now()),
    );

    expenses.add(newExpense);
    box.write('expenses', expenses.map((e) => e.toMap()).toList());
  }

  void homeInit() {
    expenses = retrieveData();
    for (var expense in expenses) {
      if (expense.category == "Salary") {
        income += expense.amount;
      } else {
        spent += expense.amount;
      }
    }
  }

  void addExpenseInit() {
    expenses = retrieveData();
  }
}
