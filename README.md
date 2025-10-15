You probably don't need a README, this thing is self explanatory and if you need this thing, you exactly know everything :)






# SQL to PDF Visualizer

A small client-side web app that parses SQL `CREATE TABLE` statements and generates a polished PDF documenting the database schema.

Files
- [index.html](index.html) — main app and UI that implements parsing, preview and PDF export.
- [test.md](test.sql) — example SQL script with sample tables and inserts.
- [LICENSE](LICENSE) — MIT license.
- [.gitattributes](.gitattributes) — repository attributes.

Quick start
1. Open [index.html](index.html) in your browser.
2. Paste your SQL DDL into the "Paste Your SQL Here" textarea (or copy from [test.md](test.sql)).
3. Click the `🔍 Parse SQL` button (calls [`parseSQL`](index.html)).
4. Inspect the preview. When ready, click `📄 Generate PDF` (calls [`generatePDF`](index.html)) to save a PDF of the schema.
5. Use `🗑️ Clear All` (calls [`clearAll`](index.html)) to reset.

What it does (features)
- Parses `CREATE TABLE` definitions from pasted SQL using [`extractTables`](index.html) and builds a structured representation of tables and columns.
- Robust column parsing via [`parseColumns`](index.html): splits column definitions while respecting parentheses (so types like `DECIMAL(10,2)` are handled).
- Skips table-level constraints (e.g., standalone `PRIMARY KEY`, `FOREIGN KEY`, `CONSTRAINT` clauses) when building the column list.
- Preview UI rendered by [`displayTables`](index.html), including:
  - Column name, data type and visual badges for common constraints (via [`formatConstraints`](index.html) and [`getTypeClass`](index.html)).
  - Color-coded type badges (string/number/date/boolean/other).
  - Auto-resizing SQL textarea for convenience.
- PDF generation with jsPDF + autoTable (CDN included in [index.html](index.html)):
  - Title page with metadata and a table-of-contents.
  - Per-table pages with a header and an autoTable listing columns, types and constraints (logic in [`generatePDF`](index.html)).
  - Pagination and footer on every PDF page.
  - Constraint formatting for PDFs via [`formatConstraintsForPDF`](index.html).

How parsing works (brief)
- [`extractTables`](index.html): strips SQL comments, normalizes whitespace and finds `CREATE TABLE` blocks using a regex that captures table name and the enclosed column-list.
- [`parseColumns`](index.html): walks the captured columns text, accumulating characters and counting parentheses so commas inside `(...)` are ignored when splitting. For each part it matches column definitions (supports backticked names and plain identifiers) and extracts name, type and trailing constraints.
- The simple constraint detectors (`formatConstraints`, `formatConstraintsForPDF`) look for tokens like `PRIMARY KEY`, `NOT NULL`, `UNIQUE`, `AUTO_INCREMENT`, and `DEFAULT` and produce readable badges or label strings.

Limitations and known behaviors
- Table-level constraints (e.g., multi-column PRIMARY KEY or FOREIGN KEY lines) are intentionally skipped in the column list; those are detected but not associated to individual columns.
- The parser is intended for typical SQL DDL; extremely unusual formatting or vendor-specific syntax might not be fully parsed.
- DEFAULT value extraction is basic; complex expressions or quoted defaults may need manual review.
- The regex-based parsing is pragmatic (works well for many inputs) but it's not a full SQL parser. For production-grade parsing, consider integrating a full SQL parser library.

Customization tips
- Styling: update the CSS in [index.html](index.html) to change preview appearance.
- PDF layout: modify options passed to `doc.autoTable` inside [`generatePDF`](index.html) to change fonts, column widths, themes or add more meta info.
- Add support for table-level constraints: extend [`parseColumns`](index.html) to collect and attach table constraints (currently skipped).
- Use a different PDF library or font by swapping the CDN scripts in [index.html](index.html).

Developer notes (relevant functions)
- Parsing & preview: [`parseSQL`](index.html), [`extractTables`](index.html), [`parseColumns`](index.html), [`displayTables`](index.html)
- UI helpers: [`getTypeClass`](index.html), [`formatConstraints`](index.html), [`showError`](index.html), [`showSuccess`](index.html), textarea auto-resize listener in [index.html](index.html)
- PDF generation: [`generatePDF`](index.html), [`formatConstraintsForPDF`](index.html)

License
This project is released under the MIT License — see [LICENSE](LICENSE).

If you want a trimmed README (shorter) or an expanded developer guide (with examples and sample outputs), let me know which form you prefer.
