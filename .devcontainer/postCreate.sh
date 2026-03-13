#!/bin/bash

set -e

mkdir -p ~/.claude
cp /tmp/claude-credentials.json ~/.claude/.credentials.json

# sudo apt install -y moreutils
# jq '. + {"hasCompletedOnboarding": true}' ~/.claude.json | sponge ~/.claude.json

cat > ~/.claude.json <<EOF
{
	"hasCompletedOnboarding": true,
	"projects": {
		"$PWD": {
			"hasTrustDialogAccepted": true
		}
	}
}
EOF

curl -fsSL https://claude.ai/install.sh | bash

curl -fsSL https://bun.sh/install | bash
export PATH="$HOME/.bun/bin:$PATH"

bunx --yes @kamranahmedse/claude-statusline