# EventStory

**EventStory** is a Python library that helps teams bring structure and governance to collaborative work happening across spreadsheets, low-code tools, and semi-manual processes.

It’s designed for use in large organisations — including public sector, nonprofits, and enterprise environments — where **semi-technical or non-technical teams** regularly build their own workflows using tools like Excel, Power BI, or Microsoft Forms.

---

## 🧠 What Problem Does It Solve?

In many organisations, “citizen developers” or analyst teams:

- Build their own pilots or tools using spreadsheets
- Modify shared data models without technical enforcement
- Make local decisions that are hard to audit or compare

This often leads to:

- **Shadow IT** and inconsistent data handling
- **Missed conflicts** when multiple teams change the same thing differently
- **Unclear provenance** around changes or modelling decisions

**EventStory** helps by providing:

- A way to **ingest and normalise** spreadsheet-based edits
- A structured **event log** of changes to key records or activities
- Built-in **conflict detection** across different teams or pilots
- Functions to **reconstruct the state** of data over time

---

## ⚙️ What You Can Do With It

- Aggregate decisions from multiple spreadsheets into a single event history
- Detect and flag **conflicting changes** to the same records
- Rebuild historical or proposed versions of a dataset for comparison or reporting
- Export results into formats suitable for dashboards (e.g. Power BI)

---

## 🧑‍💻 Who Is It For?

- **Developers or data analysts** working to support internal tooling
- **Platform or architecture teams** building lightweight governance into local tooling
- **Organisations with distributed modelling or planning processes**
- Projects trying to reduce spreadsheet sprawl while respecting how people already work

---

## 🔄 Project Status

This library is actively evolving through test-first development and exploratory use.\
Its interface and patterns may still change — but its core purpose is stable.

---

## 🧪 Test Practices

We use both unit and acceptance tests, with a strong focus on behaviour-driven development.\
In some cases, we commit _intentionally failing tests_ as part of a structured, documented test-first process.\
See `docs/failing-tests.md` for details.

---

## 📦 Usage (Coming Soon)

Example usage and installation instructions will be added once the library reaches its first tagged version.

---

## 🤝 Contributions & Feedback

We're open to contributions, shared scenarios, or discussions about similar use cases — especially around modelling governance, event-driven workflows, and hybrid digital-manual systems.
