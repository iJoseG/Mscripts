# ⚙️ Oh My Zsh Auto Installer

Un script rápido y automatizado para instalar **Zsh + Oh My Zsh + plugins útiles** (autosuggestions y syntax highlighting) en distros Linux como Ubuntu, Debian, Arch, etc.

---

## 🚀 ¿Qué hace este script?

- Instala `zsh`, `git` y `curl` si no están presentes.
- Cambia tu shell predeterminado a `zsh`.
- Instala **Oh My Zsh** silenciosamente (sin lanzar Zsh).
- Clona y configura plugins:
  - `zsh-autosuggestions`
  - `zsh-syntax-highlighting`
- Modifica automáticamente tu `~/.zshrc`.

---

## 📥 Instalación rápida

Puedes ejecutarlo directamente desde la terminal con:

```bash
bash <(curl -s https://github.com/iJoseG/Mscripts.git)
