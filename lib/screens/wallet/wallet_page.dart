import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'Wallet',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wallet Overview Section
            const Text(
              'Wallet Overview',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              // ignore: prefer_const_constructors
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Bitcoin Balance',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '0.025 BTC',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Approximate Value: \$750',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Redeem Section
            const Text(
              'Redeem Bitcoin',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone_android, color: Colors.green),
                title: const Text('Cashout to Airtime'),
                subtitle: const Text('Top up your airtime with Bitcoin.'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // Handle redeem to airtime
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.data_usage, color: Colors.blue),
                title: const Text('Cashout to Data'),
                subtitle: const Text('Buy data with your Bitcoin balance.'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // Handle redeem to data
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.money, color: Colors.orange),
                title: const Text('Cashout to Cash'),
                subtitle: const Text(
                    'Withdraw Bitcoin to your bank or mobile money.'),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  // Handle cashout to cash
                },
              ),
            ),
            const SizedBox(height: 30),

            // Transaction History Section
            const Text(
              'Transaction History',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3, // Sample transaction count
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.history, color: Colors.blue),
                    title: Text('Transaction #${index + 1}'),
                    subtitle: Text('Completed on 2024-10-2${index + 1}'),
                    trailing: const Text('\$250'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
