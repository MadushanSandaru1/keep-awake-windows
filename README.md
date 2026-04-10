# 🖱️ Keep Awake (Windows)

<p align="center">
  <b>Prevent your Windows laptop from going to sleep using a lightweight PowerShell script</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Platform-Windows-blue?style=for-the-badge">
  <img src="https://img.shields.io/badge/Language-PowerShell-5391FE?style=for-the-badge">
  <img src="https://img.shields.io/badge/Status-Active-success?style=for-the-badge">
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge">
</p>

---

## 🚀 Features

* 🟢 Prevents system sleep
* 💡 Prevents display sleep
* 📄 Real-time logging
* ⚡ Lightweight (no installation required)
* ▶️ One-click start via `.bat` file
* 🛑 Easy stop with `Ctrl + C`

---

## 📁 Project Structure

```
keep-awake/
│
├── keep-awake.ps1
├── run-keep-awake.bat
├── keep-awake.log
└── README.md
```

---

## ⚙️ How It Works

This script uses the Windows API:

```
SetThreadExecutionState
```

to notify the OS that the system should remain awake.

It sends a keep-awake signal every **30 seconds**.

---

## 🧑‍💻 Usage

### 1️⃣ Clone the repository

```bash
git clone https://github.com/MadushanSandaru1/keep-awake-windows.git
cd keep-awake-windows
```

---

### 2️⃣ Run the script

Double-click:

```
run-keep-awake.bat
```

Or via terminal:

```bash
run-keep-awake.bat
```

---

## 🛑 Stop the Script

Press:

```
Ctrl + C
```

Or close the command window.

---

## 📄 Logs

The script generates:

```
keep-awake.log
```

Example:

```
[2026-04-10 11:55:01] Script starting...
[2026-04-10 11:55:01] Keep-awake mode enabled. Flags=2147483651
[2026-04-10 11:55:31] Wake signal sent.
```

---

## ⚠️ Requirements

* Windows OS
* PowerShell

---

## 🔒 PowerShell Execution Policy Fix

If blocked, run:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

Then press `Y`.

---

## ❗ Limitations

This script does NOT override:

* Lid close sleep
* Hibernate settings
* Company-managed group policies
* Battery saver restrictions

---

## 🛠️ Future Improvements

* 🔇 Run silently in background
* 📦 Convert to `.exe`
* 🧠 Random intervals
* 🖥️ System tray icon

---

## 📜 License

MIT License

```
MIT License

Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files...
```

---

## 🙌 Contributing

Pull requests are welcome. Feel free to fork and improve.

---

## ⭐ Support

If you like this project:

* Give it a ⭐ on GitHub
* Share it with others
