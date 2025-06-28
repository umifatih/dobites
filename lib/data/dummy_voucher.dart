import '../models/voucher_model.dart';

final List<Voucher> dummyVouchers = [
  Voucher(
    title: 'WELCOME10',
    desc: 'Get \$10 OFF',
    expiry: '2025-05-31',
    code: 'WELCOME10',
    discount: 10000,
    type: 'fixed',
  ),
  Voucher(
    title: 'FASHION20',
    desc: '20% OFF Fashion',
    expiry: '2025-05-25',
    code: 'FASHION20',
    discount: 20,
    type: 'percent',
  ),
  Voucher(
    title: 'FREESHIP75',
    desc: 'Free Shipping',
    expiry: '2025-05-30',
    code: 'FREESHIP75',
    discount: 0,
    type: 'freeship',
  ),
  Voucher(
    title: 'GOPAY DEALS',
    desc: '5% OFF with GoPay',
    expiry: '2025-06-30',
    code: 'GOPAY5',
    discount: 5,
    type: 'percent',
  ),
];
