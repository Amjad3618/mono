import 'package:flutter/material.dart';

class StaticView extends StatefulWidget {
  const StaticView({super.key});

  @override
  State<StaticView> createState() => _StaticViewState();
}

class _StaticViewState extends State<StaticView> {
  String selectedTab = 'Day';
  String selectedExpense = 'Expense';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tabs Section
                Row(
                  children: [
                    _buildTab('Day', selectedTab == 'Day'),
                    const SizedBox(width: 12),
                    _buildTab('Week', selectedTab == 'Week'),
                    const SizedBox(width: 12),
                    _buildTab('Month', selectedTab == 'Month'),
                    const SizedBox(width: 12),
                    _buildTab('Year', selectedTab == 'Year'),
                  ],
                ),
                const SizedBox(height: 24),

                // Dropdown Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 1),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            selectedExpense,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey[600],
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Chart Section
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      // Chart background gradient
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFF2D9B9E).withOpacity(0.2),
                              const Color(0xFF2D9B9E).withOpacity(0.05),
                            ],
                          ),
                        ),
                      ),
                      // Chart curve
                      CustomPaint(painter: ChartPainter(), size: Size.infinite),
                      // Data point bubble
                      Positioned(
                        left: 70,
                        top: 50,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(0xFF2D9B9E),
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '\$1,230',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2D9B9E),
                            ),
                          ),
                        ),
                      ),
                      // Month labels
                      Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildMonthLabel('Mar'),
                              _buildMonthLabel('Apr'),
                              _buildMonthLabel('May', isActive: true),
                              _buildMonthLabel('Jun'),
                              _buildMonthLabel('Jul'),
                              _buildMonthLabel('Aug'),
                              _buildMonthLabel('Se'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Top Spending Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Top Spending',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    Icon(Icons.filter_list, color: Colors.grey[600], size: 20),
                  ],
                ),
                const SizedBox(height: 16),

                // Spending Items
                _buildTransactionItem(
                  logo: 'assets/images/upwork.png',
                  title: 'Upwork',
                  subtitle: 'Today',
                  amount: 500.00,
                  isIncome: true,
                ),

                // Transaction Item 2
                _buildTransactionItem(
                  logo: 'assets/images/youtube.png',
                  title: 'YouTube',
                  subtitle: 'Yesterday',
                  amount: 12.00,
                  isIncome: false,
                ),

                // Transaction Item 3
                _buildTransactionItem(
                  logo: 'assets/images/paypal.png',
                  title: 'PayPal Transfer',
                  subtitle: '2 days ago',
                  amount: 1200.00,
                  isIncome: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, bool isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF2D9B9E) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isActive ? Colors.white : Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildMonthLabel(String month, {bool isActive = false}) {
    return Text(
      month,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: isActive ? const Color(0xFF2D9B9E) : Colors.grey[500],
      ),
    );
  }

  // ignore: unused_element
  Widget _buildSpendingItem({
    required String icon,
    required String title,
    required String date,
    required String amount,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey[200]!, width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(icon, style: const TextStyle(fontSize: 22)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFFE74C3C),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Paint for Chart
class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF2D9B9E)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = const Color(0xFF2D9B9E).withOpacity(0.15)
      ..style = PaintingStyle.fill;

    // Chart path
    final path = Path();
    path.moveTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width * 0.15,
      size.height * 0.4,
      size.width * 0.25,
      size.height * 0.35,
    );
    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.3,
      size.width * 0.5,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.65,
      size.height * 0.35,
      size.width * 0.8,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.25,
      size.width,
      size.height * 0.2,
    );

    // Fill area under curve
    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    canvas.drawPath(fillPath, fillPaint);

    // Draw line
    canvas.drawPath(path, paint);

    // Draw data point
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.35), 5, paint);

    // Draw dashed line
    const dashWidth = 4.0;
    const dashSpace = 4.0;
    var startX = size.width * 0.25;
    final dashPaint = Paint()
      ..color = const Color(0xFF2D9B9E).withOpacity(0.3)
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    while (startX < size.width * 0.25 + 30) {
      canvas.drawLine(
        Offset(startX, size.height * 0.35),
        Offset(startX + dashWidth, size.height * 0.35),
        dashPaint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(ChartPainter oldDelegate) => false;
}

Widget _buildTransactionItem({
  required String logo,
  required String title,
  required String subtitle,
  required double amount,
  required bool isIncome,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        // Logo
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            logo,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Icon(Icons.business, color: Colors.grey[400], size: 24),
              );
            },
          ),
        ),
        const SizedBox(width: 16),

        // Title and Subtitle
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),

        // Amount
        Text(
          '${isIncome ? '+' : '-'}\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            color: isIncome ? const Color(0xFF00B140) : const Color(0xFFFF6B6B),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}
