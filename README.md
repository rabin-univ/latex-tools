# LaTeX Tools

**Six tools in one** for LaTeX research paper workflows; built for review papers with large bibliographies.
**Linux, macOS (apple silicon), windows compatible.

> Developed by **Mahbub Alam Rabin**  
> Department of Nanomaterials & Ceramic Engineering, BUET

---

## Tools

| # | Tool | What it does |
|---|------|-------------|
| 1 | **Reference Checker** | Finds every `\ref{}` that has no matching `\label{}` — shows exact file and line |
| 2 | **BibTeX Organizer** | Deduplicates, cleans, and reorganises your `.bib` file by section |
| 3 | **Citation Completeness** | Checks every bib entry for missing required/recommended fields with a health score |
| 4 | **DOI Validator** | Validates every DOI via CrossRef API, auto-fills missing fields (title, journal, pages…) |
| 5 | **Figure & Table Audit** | Finds missing image files, floats without captions/labels, orphan labels |
| 6 | **Writing Statistics** | Word count by section, long sentence detection, abstract word count, keyword frequency |

All results are compiled into a **single interactive HTML report** with tabs, plus plain-text reports in organised subfolders.

---

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/rabin-univ/latex-tools/main/install.sh | bash
```

> Supports macOS (Apple Silicon & Intel). No Python installation required.

---

## Usage

Navigate to your LaTeX project folder and run:

```bash
latex-tools
```

You will be prompted for your `.tex` and `.bib` filenames. All outputs are saved to a timestamped folder next to your files:

```
latex_tools_output_2026-06-27_15-10-42/
│
├── latex_tools_report.html          ← open this in your browser
│
├── 01_reference_checker/
│     └── reference_check_report.txt
├── 02_bibtex_organizer/
│     ├── main_fixed.tex
│     ├── references_fixed.bib
│     ├── used_ref.bib
│     ├── unused_ref.bib
│     └── orgbib_report.txt
├── 03_citation_completeness/
│     └── completeness_report.txt
├── 04_doi_validator/
│     ├── references_doi_enriched.bib
│     └── doi_report.txt
├── 05_figure_table_audit/
│     └── figure_audit_report.txt
└── 06_writing_statistics/
      └── writing_stats_report.txt
```

> **Your original files are never modified.** All changes are written to the output folder only.

---

## Uninstall

```bash
rm ~/.local/bin/latex-tools
```

---

## Notes

- Tool 4 (DOI Validator) requires an internet connection
- DOI lookup uses the [CrossRef API](https://www.crossref.org/documentation/retrieve-metadata/rest-api/) — no API key needed
- Processing 100+ references takes ~20–30 seconds for DOI validation

---

## License

© Mahbub Alam Rabin — Department of Nanomaterials & Ceramic Engineering, BUET.  
For academic and research use.
