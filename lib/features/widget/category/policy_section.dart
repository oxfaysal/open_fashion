import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/style/text_style.dart';

class PolicySection extends StatefulWidget {
  final Map product;
  const PolicySection({super.key, required this.product});

  @override
  State<PolicySection> createState() => _PolicySectionState();
}

class _PolicySectionState extends State<PolicySection> {
  // Shipping default open, বাকিগুলো closed
  int? _expandedIndex = 0;

  IconData _getPolicyIcon(String policy) {
    switch (policy) {
      case 'Free Flat Rate Shipping':
        return LucideIcons.truck;
      case 'COD Policy':
        return LucideIcons.tag;
      case 'Return Policy':
        return LucideIcons.refreshCw;
      default:
        return LucideIcons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> allPolicies = [
      {
        'title': widget.product['shipping'],
        'subtitle': 'Estimated to be delivered on\n${widget.product['deliveryDate']}.',
      },
      ...( widget.product['policies'] as List).map((p) => {
        'title': p,
        'subtitle': null,
      }),




    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...allPolicies.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isExpanded = _expandedIndex == index;

          return Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _expandedIndex = isExpanded ? null : index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Row(
                    children: [
                      Icon(
                        _getPolicyIcon(item['title']),
                        size: 24,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['title'],
                              style: AppTextStyle.textBlack14w400,
                            ),
                            if (isExpanded && item['subtitle'] != null) ...[
                              const SizedBox(height: 6),
                              Text(
                                item['subtitle'],
                                style: AppTextStyle.tabUnActive14w400,
                              ),
                            ],
                          ],
                        ),
                      ),
                      Icon(
                        isExpanded ? LucideIcons.chevronUp : LucideIcons.chevronDown,
                        size: 18,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 1, color: Colors.black12),
            ],
          );
        }),
      ],
    );
  }
}