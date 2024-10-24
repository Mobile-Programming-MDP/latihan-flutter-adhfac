import 'package:flutter/material.dart';

void main() {
  runApp(FinanceManagerApp());
}

class FinanceManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransactionListPage(),
    );
  }
}

class TransactionListPage extends StatefulWidget {
  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  final List<Map<String, String>> _transactions = [
    {'title': 'Belanja Bulanan', 'amount': '500.000', 'category': 'Pengeluaran'},
    {'title': 'Gaji', 'amount': '5.000.000', 'category': 'Pemasukan'},
  ];

  // Fungsi untuk menambah transaksi baru
  void _addNewTransaction(String title, String amount, String category) {
    setState(() {
      _transactions.add({'title': title, 'amount': amount, 'category': category});
    });
  }

  // Fungsi untuk menghapus transaksi
  void _deleteTransaction(int index) {
    setState(() {
      _transactions.removeAt(index);
    });
  }

  // Fungsi untuk menghitung saldo total
  int _calculateTotalBalance() {
  int total = 0;
  for (var transaction in _transactions) {
    int amount = int.parse(transaction['amount']!.replaceAll('.', ''));
    
    if (transaction['category'] == 'Pemasukan') {
      total += amount;  // Tambahkan pemasukan
    } else if (transaction['category'] == 'Pengeluaran') {
      total -= amount;  // Kurangi pengeluaran
    }
  }
  return total;
}



String _selectedFilterCategory = 'Semua';

List<Map<String, String>> _filteredTransactions() {
  if (_selectedFilterCategory == 'Semua') {
    return _transactions;
  } else {
    return _transactions
        .where((transaction) => transaction['category'] == _selectedFilterCategory)
        .toList();
  }
}

void _showAddTransactionDialog() {
  String titleInput = '';
  String amountInput = '';
  String selectedCategory = 'Pemasukan'; // Default kategori

  showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: Text('Tambah Transaksi Baru'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Judul Transaksi'),
              onChanged: (value) {
                titleInput = value;
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Jumlah (Rp)'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                amountInput = value;
              },
            ),
            // Dropdown untuk memilih kategori transaksi
            DropdownButton<String>(
              value: selectedCategory,
              items: ['Pemasukan', 'Pengeluaran'].map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!; // Pastikan nilai kategori diperbarui
                });
              },
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Batal'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
          ElevatedButton(
            child: Text('Tambah'),
            onPressed: () {
              if (titleInput.isNotEmpty && amountInput.isNotEmpty) {
                _addNewTransaction(titleInput, amountInput, selectedCategory);
                Navigator.of(ctx).pop();
              }
            },
          ),
        ],
      );
    },
  );
}


  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Pengelolaan Keuangan'),
    ),
    body: Column(
      children: <Widget>[
        // Dropdown untuk filter kategori
       Padding(
  padding: const EdgeInsets.all(10.0),
  child: DropdownButton<String>(
    value: _selectedFilterCategory, // Nilai yang saat ini dipilih
    items: ['Semua', 'Pemasukan', 'Pengeluaran'].map((String category) {
      return DropdownMenuItem<String>(
        value: category, // Nilai untuk setiap kategori
        child: Text(category), // Teks yang ditampilkan untuk kategori
      );
    }).toList(),
    onChanged: (value) {
      setState(() {
        _selectedFilterCategory = value!; // Memperbarui nilai kategori yang dipilih
      });
    },
  ),
),


        // Saldo total
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Saldo Total: Rp ${_calculateTotalBalance().toString().replaceAllMapped(RegExp(r'(\d)(?=(\d\d\d)+(?!\d))'), (Match m) => '${m[1]}.')}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),

        // Daftar transaksi yang difilter
        Expanded(
          child: ListView.builder(
            itemCount: _filteredTransactions().length,
            itemBuilder: (ctx, index) {
              return Card(
                child: ListTile(
                  title: Text(_filteredTransactions()[index]['title']!),
                  subtitle: Text(
                    'Jumlah: Rp ${_filteredTransactions()[index]['amount']} (${_filteredTransactions()[index]['category']})',
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () => _deleteTransaction(index),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: _showAddTransactionDialog,
    ),
  );
}

}
