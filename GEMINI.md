# Project: Enterprise Dotfiles Automation

## 1. Core Philosophy & Governance
- **Client (@User)**: Product Owner & Stakeholder.
    - **Responsibility**: Define requirements, approve architectural changes, and perform User Acceptance Testing (UAT).
    - **Constraint**: **No Coding**. The Client relies entirely on the AI Team for implementation.
- **AI Team (@Gemini)**: Full-Stack Development Team.
    - **Responsibility**: Architecture design, implementation, testing, and documentation.
    - **Standard**: All outputs must be production-ready, strictly following industry best practices.

## 2. Engineering Standards (Best Practices)
- **Idempotency**: All setup scripts (e.g., `install.sh`, `setup.sh`) must be safe to run multiple times without side effects.
- **Modularity**: Configuration must be decoupled.
    - *Anti-Pattern*: A single 1000-line `.zshrc`.
    - *Pattern*: `zsh/aliases.zsh`, `zsh/exports.zsh`, loaded dynamically.
- **Portability**: Code must detect the OS (macOS/Linux) and adapt logic accordingly.
- **Documentation**: "Code tells you how, comments tell you why." All complex logic requires inline documentation in English.

## 3. Tech Stack & Constraints
- **Shell**: Zsh (via Oh My Zsh framework). Scripts must follow the [Google Shell Style Guide](https://google.github.io/styleguide/shellguide.html).
- **Editor**: Neovim (NvChad distribution). Customizations must reside in the `lua/custom` directory to ensure clean upgrades.
- **Multiplexer**: Tmux.
- **Package Management**: Homebrew (macOS/Linux).
- **Version Control**: Git. Commit messages must follow [Conventional Commits](https://www.conventionalcommits.org/).

## 4. Project Roadmap & Status (Auto-Generated)
- [x] **Phase 0: Initialization**
    - [x] Define Agents & Protocols (`GEMINI.md`, `AGENTS.md`).
    - [x] Audit existing structure.
- [x] **Phase 1: Zsh Architecture**
    - [x] Modularize `.zshrc` (Split into aliases, exports, functions).
    - [x] Implement `gemini_load` for context injection.
    - [x] **Client Approval**: Phase 1 Deployed & Verified.
- [ ] **Phase 2: Tmux Configuration (NEXT UP)**
    - [ ] **Pending Decision**: Submodules vs. TPM (Client requested @Architect review).
    - [ ] Action: Create `tmux.conf` and install TPM.
- [ ] **Phase 3: Neovim Migration**
    - [ ] Action: Refactor NvChad to `custom/` folder structure.

## 5. Next Session Entry Point
> When the user returns, start by answering the question: **"Is git submodule the best practice for Tmux plugins, or should we use TPM?"**
