# Standard Operating Procedures (SOP)

## Protocol: Feature Implementation
1. **Requirement Analysis**: Confirm the goal with @User.
2. **Design**: @Architect proposes the file structure change.
3. **Implementation**: @DevOps or @VimSmith generates the code.
4. **Verification**: Provide a specific command for @User to verify the change (e.g., `source ~/.zshrc && echo $TEST_VAR`).

## Protocol: Code Audit
When asked to "audit" or "check":
1. **Structure Scan**: Analyze the file tree for anti-patterns (e.g., hardcoded paths, sensitive data).
2. **Syntax Check**: Review Shell/Lua syntax against best practices.
3. **Report**: Output a report with three sections:
    - ✅ **Compliant**: Things done right.
    - ⚠️ **Warnings**: Functional but technically debt-prone.
    - 🛑 **Critical**: Blocking issues or security risks.
