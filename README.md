| INFO PROPERTY | VALUE                 |
| ------------- | --------------------- |
| Folder Name   | **arch-ehw-old-perl** |
| File Name     | README.md             |
| Date Created  | 05/27/25              |
| Date Modified | --                    |
| Version       | 00.00.01              |
| Programmer    | **Eric Hepperle**     |

### TECHNOLOGIES

<img align="left" alt="Markdown" title="Markdown" width="26px" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/markdown/markdown-original.svg" style="padding-right:10px;" />

<img align="left" alt="Perl" title="Perl" width="26px" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/perl/perl-original.svg" style="padding-right:10px;" />


<img align="left" alt="Git" title="Git" width="26px" src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/git/git-original.svg" style="padding-right:10px;" />

<img align="left" alt="GitHub" title="GitHub" width="26px" src="https://user-images.githubusercontent.com/3369400/139448065-39a229ba-4b06-434b-bc67-616e2ed80c8f.png" style="padding-right:10px;" />

<br>

## TAGS

`Library` `Personal Projects` `Eric Hepperle's Code` `Perl`

## Purpose

This is a collection of all my _**old Perl code**_. Since I've not really written much Perl since 2013, this code library is about 10 years old. I am using GIT to organize and standardize the code, documenting with markdown files DOCBlocks, etc.

Phase 1: Identify all my Perl code and group into folders

Phase 2: Test out the code to see what works and how well

Phase 3: Fix the broken parts

Not sure how long it will take, but every journey starts with a single step. Or, as Pastor Harvey always says "bit-by-bit".

---

## Change Notes

- [] Determine how to get Perl to work in VSCODE in 2025

---


# Installing & Configuring Perl on Windows 10 in 2025

1. [Install WSL](/#install-wsl)
2. Install Ubuntu from MS Store app
3. Install Perl on Ubuntu?
4. Install VSCODE on Ubuntu?

## Intall WSL

- 2 Best ways in 2025 to run Perl on Windows 10+ seem to be WSL or Strawberry Perl (What about Komodo IDE & ActivePerl? It's not some complex paid thing)
- #GOTCHA: WSL says `Wsl/Service/CreateInstance/CreateVm/HCS/HCS_E_HYPERV_NOT_INSTALLED`
- #SOLVED:  Ensure Windows Features: Hypervisor and Windows Subsystem for Linux are installed

![Turn Windows Features On/Off:  WSL & Hyper-V](pix/screen-wsl-features-win-10-hyperv.png)

- #GOTCHA: Now HyperV and WSL are installed, but only a black screen with blinking cursor comes up
- #SOLVED: Unfortunately, to run WSL on Win 10 you have to uninstall Docker Desktop - they don't seem to play well together. Also, it doesn't matter that you are not currently running Docker, it needs to be totally installed. Now I have the Ubuntu prompt and testing with `ps -aux` works.
- #POSSIBLE:  Maybe Docker Desktop simply needs to be turned off, but I already uninstalled it.

- In the Ubuntu CLI test that Perl is installed and working with this command `perl -e 'print "Hello World!\n\n"'`. It should print **"Hello World!** followed by a blank line.


## Run Perl in VSCODE WSL from Windows

Absolutely! Here’s your **updated Quick Start** for using VS Code, WSL2, and Perl (with Git), incorporating all the key gotchas and best practices from this thread:

---

## **Quick Start: VS Code + WSL2 + Perl + Git (Ubuntu 22)**

### **1. Open a WSL Terminal**
- Press the Windows key, type `wsl`, and launch your Ubuntu terminal.

---

### **2. Move/Work in the WSL Filesystem (Recommended)**
- For best performance and compatibility, keep your project folder in your WSL home directory:
  ```bash
  cp -r /mnt/c/Users/YourName/Documents/your_project_folder ~/your_project_folder
  cd ~/your_project_folder
  ```
- If you must use files on Windows, access them via `/mnt/c/...`, but expect slower performance and possible permission issues.

---

### **3. Start VS Code in WSL**
- In your WSL terminal, from your project directory, run:
  ```bash
  code .
  ```
- Confirm the bottom-left of VS Code shows `WSL: Ubuntu`.

---

### **4. Open the Correct Project Folder**
- Always open the folder containing your `.git` directory, not a parent or just the `.git` folder.

---

### **5. Install/Verify VS Code Extensions**
- Ensure these are installed and enabled (in WSL):
  - **Remote - WSL** (Microsoft)
  - **Perl Navigator** (bscan) or **Perl** (Gerald Richter)
  - **Git** (built-in; check it’s enabled in WSL)

---

### **6. Configure Git in WSL**
- In your WSL terminal, set your Git identity:
  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "your@email.com"
  ```
- For Linux development, set line endings:
  ```bash
  git config --global core.autocrlf input
  ```
- If working on `/mnt/c/...` and see permission issues:
  ```bash
  git config core.fileMode false
  ```

---

### **7. Use Git Only in WSL**
- Do not use Git for Windows and WSL Git on the same repo. Always use the WSL terminal or the VS Code terminal (which should be WSL bash).

---

### **8. Working with Perl**
- Test Perl:
  ```bash
  perl -v
  ```
- Run scripts:
  ```bash
  perl yourscript.pl
  ```
- Install modules with `cpanm` as needed, using `local::lib` for user installs.

---

### **9. Open the Integrated Terminal in VS Code**
- Use ``Ctrl+` `` or Terminal > New Terminal. It should open a WSL bash shell.

---

## **Common Pitfalls & Fixes**

| Problem                            | Solution                                                   |
| ---------------------------------- | ---------------------------------------------------------- |
| All files show as untracked in Git | Open VS Code in WSL, configure Git user/email in WSL       |
| Git asks for user.name/user.email  | Set with `git config --global user.name/email` in WSL      |
| VS Code not in WSL mode            | Always launch with `code .` from WSL terminal              |
| Slow file operations               | Move project to WSL filesystem (`~/project`)               |
| Permission/line ending issues      | Set `core.fileMode false` and `core.autocrlf input` in Git |
| Git extension not working          | Enable/install in WSL, open correct folder                 |

---

**You’re now set up for smooth Perl and Git development in VS Code on WSL2!**  
Let me know if you want a printable checklist or further automation tips.

---
Answer from Perplexity: pplx.ai/share

---

## Resources:
  - https://learn.microsoft.com/en-us/answers/questions/1336873/how-to-solve-wsl-service-createinstance-createvm-h
  - https://github.com/microsoft/WSL/issues/11923
  - https://learn.microsoft.com/en-us/windows/wsl/troubleshooting#installation-issues