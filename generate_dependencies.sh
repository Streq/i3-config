#!/bin/bash

set -e

setup_file="$HOME/.config/i3/install_dependencies.sh"

deps=$(find "$HOME/.config/i3/config.d" -type f | sort | xargs rg -j1 --no-filename --no-line-number -o -r "\$1" "\`\`\`(.*)\`\`\`")

cat > "$setup_file" << EOF
#!/bin/bash
$deps
EOF

chmod +x "$setup_file"
