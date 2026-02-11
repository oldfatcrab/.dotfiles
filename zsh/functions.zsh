# ==========================================
# Gemini Context Auto-Loader
# ==========================================

function gemini_load() {
    local prompt=""
    local -a loaded_files
    
    # Define files and their corresponding headers in desired load order
    local -a files_to_check=(
        "GEMINI.md:[SYSTEM: Load Rules]"
        "AGENTS.md:[SYSTEM: Load Team]"
        "SKILLS.md:[SYSTEM: Load Skills]"
    )

    # Loop through files to build prompt and status
    for entry in "${files_to_check[@]}"; do
        local file="${entry%%:*}"
        local header="${entry#*:}"

        if [[ -f "$file" ]]; then
            prompt+="${header}\n$(cat "$file")\n\n"
            loaded_files+=("$file")
        fi
    done

    # Execution Logic
    if (( ${#loaded_files[@]} > 0 )); then
        # Join loaded files with comma for display
        local file_list="${loaded_files[*]}"
        echo "⚡️ Detected Project Context. Injecting: ${file_list// /, }..."
        
        prompt+="[USER TASK: Resume Context]\nWe are resuming development. Please analyze the loaded files and wait for instructions."
        command gemini --prompt-interactive "$prompt" "$@"
    else
        command gemini "$@"
    fi
}
