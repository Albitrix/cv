# LaTeX Curriculum Vitae — Bilingual (EN / IT) & Privacy-Ready

A modular, clean, and modern single-page LaTeX Curriculum Vitae template supporting both **English** and **Italian** versions with 100% shared styling, macros, and structural skeleton, paired with **complete separation between layout code and sensitive personal data**.

All personal information, contact details, home address, and profile photo remain local and are automatically ignored by Git.

---

## Key Features

- **Single-page Layout**: Carefully tuned typography, margins, and vertical spacing to fit full professional profiles into exactly one page.
- **Bilingual (EN / IT)**: Switch between Italian and English while sharing the same underlying architecture and design.
- **Privacy by Design**: Sensitive data in `content/`, your photo `assets/profile.*`, and compiled `*.pdf` files are excluded by `.gitignore`.
- **Immediate Compilation (Zero-Config Fallback)**: If `content/` does not exist yet (e.g., right after cloning), the template automatically falls back to anonymized sample data in `content.example/`.
- **Flexible Photo Support**: Place your picture as `assets/profile.jpg`, `assets/profile.png`, or `assets/profile.jpeg`. It will be automatically centered and clipped with rounded corners. If no image is provided, a clean user-icon placeholder is displayed.
- **Automated Build System**: Powered by `latexmk` and `Makefile`, isolating temporary LaTeX build artifacts in `build/`.

---

## Quickstart: How to Clone & Build Your CV

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/<repo-name>.git cv
cd cv
```

### 2. Initialize Your Private Content Directory

Run the following command to duplicate the demo templates from `content.example/` into your local `content/` folder:

```bash
make init
```

> [!TIP]
> Running `make` or `make all` will also automatically invoke `make init` if the `content/` folder is missing.

### 3. Add Your Profile Photo (Optional)

Place your photo into the `assets/` directory using any of the supported filenames:
- `assets/profile.jpg`
- `assets/profile.png`
- `assets/profile.jpeg`

The template automatically centers and clips the photo into a **1.7 cm × 2.1 cm** frame (~4:5 aspect ratio) with subtle rounded corners.
Because of `.gitignore`, your personal photo will never be committed to Git.

### 4. Fill In Your Personal Information

Edit the files inside `content/en/` and `content/it/`:

| File | Purpose |
| :--- | :--- |
| `info.tex` | Name, job title/subtitle, location, email, optional phone/address, and web/social links |
| `experience.tex` | Work experience, roles, dates, and responsibilities |
| `education.tex` | Degrees, universities, grades, and academic focus |
| `projects.tex` | Selected personal or academic projects with links and descriptions |
| `skills.tex` | Programming languages, technologies, databases, frameworks, and spoken languages |

#### Header Customization & Optional Fields (`info.tex`)

In `content/it/info.tex` and `content/en/info.tex`:

```latex
\newcommand{\cvName}{Firstname Lastname}
\newcommand{\cvRole}{Software Engineer $|$ M.Sc. Student}

% Contact details (left column of the contact block)
\newcommand{\cvLocation}{Milan, Italy}
\newcommand{\cvEmail}{your.email@example.com}
\newcommand{\cvPhone}{+39 333 1234567}  % Optional: displayed in the 3rd row with phone icon
\newcommand{\cvAddress}{Via Roma 1}     % Optional: appended to \cvLocation in the 1st row

% Professional links (right column of the contact block)
\newcommand{\cvLinkedIn}{in/your-profile}
\newcommand{\cvLinkedInUrl}{https://linkedin.com/in/your-profile}
\newcommand{\cvGitHub}{github.com/your-username}
\newcommand{\cvGitHubUrl}{https://github.com/your-username}
\newcommand{\cvWebsite}{yourwebsite.com}
\newcommand{\cvWebsiteUrl}{https://yourwebsite.com}
```

If `\cvPhone` or `\cvAddress` are left empty (`{}`), the layout dynamically adapts without any awkward whitespace or misalignment.

### 5. Compile the PDFs

Compile both Italian and English versions:

```bash
make
# or
make all
```

The resulting files will be generated in the root directory:
- `cv_it.pdf` (Italian version)
- `cv_en.pdf` (English version)

---

## Compilation Commands

The project uses a GNU `Makefile` that orchestrates `latexmk`:

- **Compile both versions (`cv_it.pdf` and `cv_en.pdf`):**
  ```bash
  make
  # or
  make all
  ```

- **Compile only the Italian version (`cv_it.pdf`):**
  ```bash
  make it
  ```

- **Compile only the English version (`cv_en.pdf`):**
  ```bash
  make en
  ```

- **Live auto-recompile on every file save (continuous preview):**
  ```bash
  make watch-it
  # or
  make watch-en
  ```

- **Clean all generated PDFs and temporary build files:**
  ```bash
  make clean
  ```

---

## Project Structure

```text
.
├── cv_it.tex                 # Entry point for the Italian CV
├── cv_en.tex                 # Entry point for the English CV
├── main.tex                  # Default entry point (defaults to Italian)
├── cv_template.tex           # Shared structural skeleton (loads sections dynamically)
├── cv_header.tex             # Header layout (photo, name, role, contacts, social links)
├── cv_style.sty              # Shared typography, colors, margins, icons, and babel setup
├── Makefile                  # Build orchestration and auto-initialization
├── .latexmkrc                # Configures latexmk to output auxiliary files to build/
├── .gitignore                # Excludes private content, photos, and build artifacts
│
├── assets/                   # Static graphical assets
│   ├── .gitkeep              # Keeps the folder tracked in Git
│   └── profile.png           # (Private, local) Your personal photo (ignored by Git)
│
├── content.example/          # PUBLIC SAMPLE TEMPLATES (Tracked in Git)
│   ├── it/                   # Sample Italian files (Mario Rossi)
│   │   ├── info.tex
│   │   ├── experience.tex
│   │   ├── education.tex
│   │   ├── projects.tex
│   │   └── skills.tex
│   └── en/                   # Sample English files (John Doe)
│       └── ...
│
└── content/                  # PRIVATE DATA (Excluded from Git via .gitignore)
    ├── it/                   # Your actual personal data (Italian)
    └── en/                   # Your actual personal data (English)
```

---

## Privacy Architecture

To safely keep this repository public on GitHub, [`.gitignore`](.gitignore) is pre-configured to ignore:
- `content/`: All your real biographical data, experiences, skills, and contacts.
- `assets/profile.*`: Your personal photo (`.jpg`, `.png`, `.jpeg`).
- `*.pdf`: All generated PDF outputs.
- `build/`: LaTeX intermediate files (`.aux`, `.log`, `.out`, `.fls`, `.fdb_latexmk`, etc.).

Anyone who clones your repository will only see the public code structure and the dummy examples in `content.example/`.

---

## Prerequisites

To compile this project locally, ensure you have:

- **TeX Live / MacTeX / MiKTeX**:
  - Ubuntu / Debian: `sudo apt install texlive-latex-extra texlive-fonts-extra texlive-lang-italian latexmk`
  - macOS (Homebrew): `brew install --cask mactex-no-gui`
  - Arch Linux: `sudo pacman -S texlive-meta texlive-fontsextra`
- **Build tools**: `make` and `latexmk`.

---

> **AI Note:** This project was built with the assistance of **Gemini 3.8 Flash**.
