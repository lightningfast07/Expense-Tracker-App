import 'package:expensetracker/model/expense.dart';
import 'package:expensetracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });

  final void Function(Expense expense) removeExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // builder renders only what can be visible atm putting less stress than column and Listview is a scrollable view
    return ListView.builder(
      //itemCount tells how many items are there
      //itemBuilder takes 0-based indexing and prints the title using function
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        //ValueKey is used to create a key widget
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.9),
          margin: EdgeInsets.all(Theme.of(context).cardTheme.margin!.vertical),
        ),
        onDismissed: (direction) {
          removeExpense(expenses[index]);
        },
        child: ExpenseItem(
          expenses[index],
        ),
      ),
    );
  }
}
