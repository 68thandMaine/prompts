# Agent Prompts

This directory contains the "personality" of an Ai agent via cursor. It is meant
to be installed as a repo inside existing repos to promote a universal Ai
experience. Think of this like the bumpers that prevent a bowling ball from
rolling into a gutter.

Each file is formatted as `.mdc` to integrate with cursor. Basically this
directory contains the contents of a `.cursor/rules/` directory.

## Installation with Git Submodules

This repository is designed to be installed as a Git submodule in your projects to maintain consistent AI agent behavior across all your repositories. Git submodules allow you to keep a reference to an external repository within your own repository.

### Adding as a Submodule

To add this repository as a submodule in your existing project:

```bash
# Add the submodule to your project's .cursor/rules directory
git submodule add https://github.com/yourusername/core_prompts.git .cursor/rules

# Or add it to a different location
git submodule add https://github.com/yourusername/core_prompts.git core_prompts
```

### Sparse Checkout (Context Only)

If you only want to install the context files (recommended for minimal setup):

```bash
# Add the submodule
git submodule add https://github.com/yourusername/core_prompts.git .cursor/rules

# Configure sparse checkout to only get context files
cd .cursor/rules
git config core.sparseCheckout true
echo "context/*" > .git/info/sparse-checkout
git checkout

# Or use the provided setup script (after cloning)
# Download and run the setup script
curl -fsSL https://raw.githubusercontent.com/yourusername/core_prompts/main/setup-sparse-checkout.sh | bash -s .cursor/rules
```

This will only checkout the `context/` directory containing the essential AI agent prompts.

### Cloning a Repository with Submodules

If you're cloning a repository that already has this as a submodule:

```bash
# Clone with submodules
git clone --recurse-submodules https://github.com/yourusername/your-project.git

# Or if you already cloned without submodules
git submodule update --init --recursive

# To configure sparse checkout for existing submodule
cd .cursor/rules  # or your submodule path
git config core.sparseCheckout true
echo "context/*" > .git/info/sparse-checkout
git checkout
```

### Updating the Submodule

To update the core prompts to the latest version:

```bash
# Update all submodules to their latest remote versions
git submodule update --remote

# Or update a specific submodule
git submodule update --remote .cursor/rules
```

### Benefits of Using Submodules

- **Consistency**: Maintain the same AI agent personality across all your projects
- **Version Control**: Track which version of the prompts you're using
- **Updates**: Easily update all projects to use the latest prompts
- **Isolated**: Changes to the core prompts don't affect your main project history
- **Collaboration**: Team members get the same AI behavior setup

### Alternative Installation Methods

If you prefer not to use submodules, you can also:

- Copy the `.mdc` files directly into your project's `.cursor/rules/` directory
- Use symbolic links to reference a central copy
- Use Git subtree instead of submodules for a more integrated approach

### Usage

```bash
# Format all markdown files
npm run format:md

# Check if markdown files are properly formatted
npm run format:check-md

# Format all files (including non-markdown)
npm run format

# Check formatting for all files
npm run format:check
```

### Configuration

- `.prettierrc` - Prettier configuration with markdown-specific settings
- `.prettierignore` - Files and directories to exclude from formatting
- `.markdownlint.json` - Additional markdown linting rules
