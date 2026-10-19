/// Strips the time part so dates can be compared per calendar day.
DateTime dateOnly(DateTime d) => DateTime(d.year, d.month, d.day);

/// Firestore document key for a calendar day, e.g. 2026-10-19.
String toDateKey(DateTime d) =>
    '${d.year.toString().padLeft(4, '0')}-'
    '${d.month.toString().padLeft(2, '0')}-'
    '${d.day.toString().padLeft(2, '0')}';
