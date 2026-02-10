# ==========================================
# Gemini Context Auto-Loader
# ==========================================

function gemini_load() {
    local prompt=""
    local has_context=false

    # 1. try loading GEMINI.md
    if [[ -f "GEMINI.md" ]]; then
        prompt+="[SYSTEM: Load Rules]\n$(cat GEMINI.md)\n\n"
        has_context=true
    fi

    # 2. try loading AGENTS.md
    if [[ -f "AGENTS.md" ]]; then
        prompt+="[SYSTEM: Load Team]\n$(cat AGENTS.md)\n\n"
        has_context=true
    fi

    # 3. try loading SKILLS.md
    if [[ -f "SKILLS.md" ]]; then
        prompt+="[SYSTEM: Load Skills]\n$(cat SKILLS.md)\n\n"
        has_context=true
    fi

    # 3. Execution Logic
    if [ "$has_context" = true ]; then
        echo "⚡️ Detected Project Context. Injecting AGENTS & GEMINI & SKILLS..."
        prompt+="[USER TASK: Resume Context]\nWe are resuming development. Please analyze the loaded files and wait for instructions."
        
        command gemini --prompt-interactive "$prompt" "$@"
    else
        command gemini "$@"
    fi
}
