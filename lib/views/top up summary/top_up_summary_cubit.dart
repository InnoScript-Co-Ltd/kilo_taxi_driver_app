import 'package:flutter_bloc/flutter_bloc.dart';

class TopUpSummaryCubit extends Cubit<List<Map<String, String>>> {
  TopUpSummaryCubit() : super([]);

  // Function to load transactions
  void loadTransactions() {
    final List<Map<String, String>> transactions = List.generate(
      8,
      (index) => {
        "date": "12 05 2024",
        "time": "12:00 AM",
        "amount": "000,000 MMK",
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
