import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionCubit extends Cubit<List<Map<String, String>>> {
  TransactionCubit() : super([]);

  // Function to load transactions
  void loadTransactions() {
    final List<Map<String, String>> transactions = List.generate(
      8,
      (index) => {
        "date": "12 05 2024",
        "time": "12:00 AM",
        "amount": "+ 500 MMK",
      },
    );
    emit(transactions);
  }

  // Function to calculate total amount
  int calculateTotal() {
    return state
        .map((transaction) =>
            int.parse(transaction["amount"]!.replaceAll(RegExp(r'[^0-9]'), '')))
        .reduce((value, element) => value + element);
  }
}
